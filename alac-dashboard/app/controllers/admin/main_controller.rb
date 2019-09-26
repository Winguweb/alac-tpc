module Admin
  class MainController < Admin::ApplicationController
    include MainHelper
    include SelectHelper
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
      @characterization = Characterization.where(case_id: params[:id]).first
      if @characterization.blank?
        @characterization = Characterization.create(case_id: params[:id])
      end

      @data = []
      elements = get_report_detail(params[:id])
      index = elements.each_index.select{|i| elements[i][1] != '-'} 

      index.each do |i|
        @data.push(elements[i])      
      end
   
      @documents = get_files(params[:id])
      @actors = Characterization.where(case_id: params[:id]).first.actors
      @actors_select = Actor.all

      @evolution = Evolution.new

      @penal_stage_options = penal_stage_options
      @fiscal_stage_options = fiscal_stage_options
      @disciplinary_stage_options = disciplinary_stage_options

      @penal_situation_options = penal_situation_options
      @fiscal_situation_options = fiscal_situation_options
      @disciplinary_situation_options = disciplinary_situation_options

      @crime_options = crime_options




    end

    def download
      stream_xlsx()
    end

    
  end
end




















