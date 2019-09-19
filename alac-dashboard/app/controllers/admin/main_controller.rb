module Admin
  class MainController < Admin::ApplicationController
    require 'sqlite3'

    def index
      @reports = get_index_reports()
        
      @reports.each do | report|
        report.push(get_info_report(report[1])[0][0])
        report.push(get_info_report(report[1])[0][1])
      end
      # @resources = Kaminari.paginate_array(@reports).page(params[:page]).per(10)


    end

    def show
      @data = []
      elements = get_report_detail(params[:id])
      index = elements.each_index.select{|i| elements[i][1] != '-'} 

      index.each do |i|
        @data.push(elements[i])      
      end
   
      @documents = get_files(params[:id])
    end
    
    private
    
    def get_files(id)
      run_query("select name from internalfile where internaltip_id = '#{id}'")
       # run_query("select id from internaltip Limit 1")
    end

    def get_info_report(id)
      run_query("select status,creation_date from internaltip where id = '#{id}'")
       # run_query("select id from internaltip Limit 1")
    end

    def get_title_option(id)

      # /([a-zA-Z0-9_\-\.]+)\-([a-zA-Z0-9_\-\.]+)\-([a-zA-Z0-9_\-\.]+)/.match(a)
      run_query("select label from fieldoption where id = '#{id}'")
      
    end
      
    def get_index_reports()
      run_query("SELECT id , internaltip_id from receivertip")
    end

    def get_question_labels(question_ids)
      questions = []
      question_ids.each do |id|

        query = "SELECT field.label FROM field WHERE field.id == '#{id}'"
        lbl = run_query(query)
        p lbl
      
        questions.push(eval(lbl.last.last)[:es])
      end
      return questions
    end

    def run_query(query)
      begin
        
        db = SQLite3::Database.open '../../var/globaleaks/globaleaks.db'
        stm = db.prepare query 
        rs = stm.execute 
        array = []
        rs.each do |row|
          
          array.push(row)
        end
        return array
     
      rescue SQLite3::Exception => e 
     
        puts "Exception occurred"
        puts e
     
      ensure
        stm.close if stm
        db.close if db
      end
    end

    def get_report_detail(id)
        
      query = "SELECT internaltipanswers.answers FROM internaltipanswers INNER JOIN receivertip ON internaltipanswers.internaltip_id =receivertip.internaltip_id WHERE  receivertip.internaltip_id = '#{id}'"
      data = run_query(query)
      sin_proceso = []
      con_proceso = []
      question_ids = []
      answers = []
      agregado = []
      data.each do |r|
        report = eval(r.last)


        report.each do |el|
          reporte_individual = []
          reporte_individual.push(el[0])
          if el[1].count > 0 
            el[1][0].delete(:required_status)
            reporte_individual.push(el[1][0])
            sin_proceso.push(reporte_individual)
          end
        end
        
        sin_proceso.each do |x|
          elemento_procesado = []
          query = "SELECT field.label FROM field WHERE field.id == '#{x[0]}'"
          lbl = run_query(query)
          p lbl
          elemento_procesado.push(eval(lbl.last.last)[:es])
          p lbl
          if !x[1].nil?
            if !x[1][:value].nil?
              final_answer = "carlos"
              x[1].each do |j|
                if j.class == Array
                  
                  pre_answer =  j[1].nil? ? nil : j[1]
                  if !pre_answer.nil? 
                    if /([a-zA-Z0-9_\-\.]+)\-([a-zA-Z0-9_\-\.]+)\-([a-zA-Z0-9_\-\.]+)/.match(pre_answer).nil?
                       
                        final_answer = pre_answer
                    else
                      lbl = get_title_option(pre_answer)
                     
                      final_answer = eval(lbl.last.last)[:es]
                    end
                 
                  end
                end

              end
              answer = final_answer
            else
  
              sin_proceso_espacial = []
              x[1].each do |el|
                especial_individual = []
                especial_individual.push(el[0])
                p el 
                p el.count
                if el[1].class == Array
                  if el[1].count > 0 
                    el[1][0].delete(:required_status)
                    especial_individual.push(el[1][0])
                    sin_proceso_espacial.push(especial_individual)
                    p especial_individual
                    
                  end
                end
              end
              sin_proceso_espacial.each do |ans|
                agregado.push(ans[1][:value])
              end
              answer = "-"
            end
            elemento_procesado.push(answer)
            con_proceso.push(elemento_procesado)
          end
        end

      end
      if agregado.count > 0
        con_proceso.push(["Edad",agregado[0]])
        lbl = get_title_option(agregado[1])
        con_proceso.push(["Genero", eval(lbl.last.last)[:es] ] )
      end
      return con_proceso
    end 

  end
end