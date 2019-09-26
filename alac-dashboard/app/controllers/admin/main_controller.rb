module Admin
  class MainController < Admin::ApplicationController
    include MainHelper
    include Streamable

    def index
      @reports = get_index_reports()
      
      @reports.each do | report|
        report.push(get_info_report(report[0])[0][0])
        report.push(get_info_report(report[0])[0][1])
      
      
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
      @actors_select = Actor.all
    end

    def download
      stream_xlsx()
    end
  end
end




















