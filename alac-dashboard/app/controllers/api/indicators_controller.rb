module Api
  class IndicatorsController < ApplicationController
    include MainHelper
    def main

      respond_to do |format|
       
        case params[:type] 
        when "age"    
          format.json { render json: get_age_data}
        when "ambit"    
          format.json { render json: get_ambit_data }
        when "corruption"    
          format.json { render json: get_corruption_data }
        when "location"    
          format.json { render json: get_report_location }
        when "sector"    
          format.json { render json: get_sector_data }
        when "gender"    
          format.json { render json: get_gender_data }
        when "occupation"
          format.json { render json: get_occupation_data }
        when "rights_violated"
          format.json { render json: get_rights_violated}
        else
          format.json { render json: "Wrong Params" }
        end

      end
    end

    private 

    def get_data(element)

      data_arr = []

      Characterization.all.each do |c|
        unless c[element].nil? || c[element] == ''
          parsed_array = JSON.parse(c[element])
          parsed_array.each do |d|
            data_arr.push(d)
          end
        end
      end
      return data_arr

    end

    def get_ambit_data
      # es de la caracterizacion
      return convert_arr_to_hash(get_data(:affected_area))
    end

    def get_sector_data
      return convert_arr_to_hash(get_data(:affected_sector))
    end

    def get_corruption_data
      return convert_arr_to_hash(get_data(:kind_corruption))
    end

    def get_rights_violated 
      return convert_arr_to_hash(get_data(:rights_violated))
    end

    def get_report_location 
      data = []
      get_answers.each do |ans|
        report = eval(ans.last)
        report.each do |el|
          if el[1].count > 0 
      
            if el[0] == :"8872417a-7ee7-49d9-a05c-2a5d86633750"
              el[1][0].delete(:required_status)
              lbl = get_title_option(el[1][0][:value])
              final_answer = eval(lbl.last.last)[:es]
              data.push(final_answer)
              # data.push(el[1][0])
            end
          end
        end
      end
      result = data.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
      return result
    end

    def get_gender_data
      return get_personal_data(:"a9cb9e02-7687-4144-8ed6-c646149263f8")
    end

    def get_occupation_data
      data = []
      get_answers.each do |ans|
        report = eval(ans.last)
        report.each do |el|
          if el[1].count > 0
            if el[0] == :"4e6ee90e-308a-493b-bdb1-1817175809cb"
              el[1][0].delete(:required_status)
              lbl = get_title_option(el[1][0][:value])
              final_answer = eval(lbl.last.last)[:es]
              data.push(final_answer)
            end
          end
        end
      end
      result = data.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
      return result
    end

    def get_age_data
      

      ranges = {}
      
      ranges["18-24"] = 0 
      ranges["25-29"] = 0 
      ranges["30-34"] = 0 
      ranges["35-39"] = 0 
      ranges["40-44"] = 0 
      ranges["45-49"] = 0 
      ranges["50-54"] = 0 
      ranges["55-59"] = 0 
      ranges["60-64"] = 0 
      ranges["65-70 o más"] = 0 

      ages = get_personal_data(:"04a822ac-076a-4b03-bdeb-9b5b65aee7d2")
      ages.each do |age| 
        a = age[0].to_i
        case a

        when 18..24   
          total =  ranges["18-24"] + age[1]
          ranges["18-24"] = total
        when 25..29
          total =  ranges["25-29"] + age[1]
          ranges["25-29"] = total
        when 30..34   
          total =  ranges["30-34"] + age[1]
          ranges["30-34"] = total
        when 35..39  
          total =  ranges["35-39"] + age[1]
          ranges["35-39"] = total
        when 40..44 
          total =  ranges["40-44"] + age[1]
          ranges["40-44"] = total
        when 45..49
          total =  ranges["45-49"] + age[1]
          ranges["45-49"] = total
        when 50..54
          total =  ranges["50-54"] + age[1]
          ranges["50-54"] = total
        when 55..59
          total =  ranges["55-59"] + age[1]
          ranges["55-59"] = total
        when 60..64
          total =  ranges["60-64"] + age[1]
          ranges["60-64"] = total
        else
          total =  ranges["65-70 o más"] + age[1]
          ranges["65-70 o más"] = total
        end
      end
      return ranges
    end

    def get_personal_data(id)
      data = []
      tmp = []
      get_answers.each do |ans|
        report = eval(ans.last)
        tmp.push(report)
        report.each do |el|
          if el[1].count > 0 
            if el[0] == :"1f3280af-91af-415c-9b73-c0f7b2a58488"
  
              if /([a-zA-Z0-9_\-\.]+)\-([a-zA-Z0-9_\-\.]+)\-([a-zA-Z0-9_\-\.]+)/.match(el[1][0][id][0][:value]).nil?
                
                data.push(el[1][0][id][0][:value])
              else
                lbl = get_title_option(el[1][0][id][0][:value])
                final_answer = eval(lbl.last.last)[:es]
                data.push(final_answer)
              end
            end
          end
        end
      end
      result = data.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }

      return result
    end
    def convert_arr_to_hash(arr)
      data = []
      val = Hash.new(0)

      arr.each do |d|
        val[d] += 1
      end

      val.each do |v|
        aux = Hash.new
        aux[v[0]] = v[1]
        data.push(aux)
      end
      return data
    end
  end
end