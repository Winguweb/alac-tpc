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
      @actors = Actor.all
      if @characterization.blank?
        @characterization = Characterization.create(case_id: params[:id])
      end
      @characterization_id = @characterization.id
      @actors = @characterization.actors
      @actors_select = Actor.all
      @evolution = Evolution.new

      @evolutions = @characterization.blank? ? [] : @characterization.evolutions
      @data = []
      elements = get_report_detail(params[:id])
      index = elements.each_index.select{|i| elements[i][1] != '-'} 

      index.each do |i|
        @data.push(elements[i])      
      end
   
      @documents = get_files(params[:id])

      @relationships = Relationship.where(characterization_id: @characterization.id)

      @relationship = Relationship.new
      @get_options = get_options
      @participation_options = participation_options

    end

    def download
      stream_xlsx()
    end

  end
end




















