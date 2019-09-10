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
        data = get_report_detail(params[:id])
        questions = data[:questions]
        # @answers = data[:answers]
        answers = []
        data[:answers].each do |ans|
          if ans.class == String 
            if /([a-zA-Z0-9_\-\.]+)\-([a-zA-Z0-9_\-\.]+)\-([a-zA-Z0-9_\-\.]+)/.match(ans).nil?
              answers.push(ans)
              
            else
              
              lbl = get_title_option(ans)
              answers.push((eval(lbl.last.last)[:es]))
            end
          else
            answers.push(ans)
          end
        end

        index = answers.each_index.select{|i| answers[i] != '-'} 

        @answers = []
        @questions = []
        index.each do |i|
          @answers.push(answers[i])
          @questions.push(questions[i])
        end
      end
      private
    
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
        question_ids = []
        answers = []
        data.each do |r|
          report = eval(r.last)
          report.keys.each do |id|
            question_ids.push(id)
          end
        
          report.values.each do |x|
            answer = x[0][:value].nil? ? "-" : x[0][:value]
            answers.push(answer)
          end
        end
        
        data = {}
        data[:questions] = get_question_labels(question_ids)
        data[:answers] = answers
        return data
      end
  end
end