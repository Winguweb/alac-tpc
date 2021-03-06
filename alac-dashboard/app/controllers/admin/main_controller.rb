module Admin
  class MainController < Admin::ApplicationController
    include MainHelper
    include SelectHelper
    include Streamable
    require 'json'
    helper_method :parse_stringify_arr, :authority_other_option, :tool_other_option

    def index
      @reports = get_index_reports()
      
      @reports.each do | report|
        report.push(get_info_report(report[0])[0][0])
        report.push(get_info_report(report[0])[0][1])
      
      
      end
      @reports = Kaminari.paginate_array(@reports).page(params[:page]).per(10)
      
    end

    def show
      @characterization = Characterization.where(case_id: params[:id]).first

      if @characterization.blank?
        @characterization = Characterization.create(case_id: params[:id])
      end

      @tool = Tool.new
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
      @advisories = @characterization.blank? ? [] : Advisory.where(characterization_id: @characterization.id)
      @advisory = Advisory.new
      @participation_options = participation_options

      @kind_answer_options = kind_answer_options

      @characterization_form_options = characterization_form_options

      @corruption_options = corruption_options
      @affected_area_options = affected_area_options
      @affected_sector = affected_sector
      @rights_violated = rights_violated
      @kind_responsability = kind_responsability
      @crime = crime

    end

    def download
      stream_xlsx()
    end

  end
end




















