module Api
  class IndicatorsController < Admin::ApplicationController
    include MainHelper
    def main

      respond_to do |format|
        p params
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
        else
          format.json { render json: "Wrong Params" }
        end

      end
    end

    private 


    def get_ambit_data
      # es de la caracterizacion
      data = []
      query = Characterization.all.group_by(&:affected_area)
      query.keys.each do |key|
        val = Hash.new
        val[key]= query[key].count
        data.push(val)
      end
      return data
    end

    def get_sector_data
      # es de la caracterizacion
      data = []
      query = Characterization.all.group_by(&:affected_sector)
      query.keys.each do |key|
        val = Hash.new
        val[key]= query[key].count
        data.push(val)
      end
      return data
    end

    def get_corruption_data
      data = []
      query = Characterization.all.group_by(&:kind_corruption)
      query.keys.each do |key|
        val = Hash.new
        val[key]= query[key].count
        data.push(val)
      end
      return data
      #characterization kind_corruption
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

    def get_age_data
      return get_personal_data(:"04a822ac-076a-4b03-bdeb-9b5b65aee7d2")
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

  end
end