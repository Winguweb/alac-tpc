module Admin
  class CharacterizationsController < Admin::ApplicationController
    include MainHelper
    include SelectHelper
    helper_method :characterization_form_options, :corruption_options, :rights_violated, :crime, :affected_sector
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      allowed_params = allowed_index_params
      @status = allowed_params[:status]
      @scope = allowed_params[:scope]
      @kind_corruption = allowed_params[:kind_corruption]
      @rights_violated = allowed_params[:rights_violated]
      @affected_sector = allowed_params[:affected_sector]
      @crime = allowed_params[:crime]
      @page = allowed_params[:page]
      @characterizations = Characterization.all
      @characterizations = characterization_finder
      @characterizations = @characterizations.order(created_at: :desc).page(params[:page]).per(10)
      super

    end

    private

    def allowed_index_params
      allowed_params = params.permit(:status, :scope, :kind_corruption, :rights_violated, :affected_sector, :crime, :page)
      allowed_params.reject{ |_, v| v.blank? }
    end

    def characterization_finder
      @characterizations_filter = @characterizations
      @characterizations_filter = filter_by_status if @status
      @characterizations_filter = filter_by_scope if @scope
      @characterizations_filter = filter_by_kind_corruption if @kind_corruption
      @characterizations_filter = filter_by_rights_violated if @rights_violated
      @characterizations_filter = filter_by_affected_sector if @affected_sector
      @characterizations_filter = filter_by_crime if @crime
      @characterizations_filter
    end

    def filter_by_status
      @characterizations_filter.where(status: @status)
    end

    def filter_by_scope
      @characterizations_filter.where(scope: @scope)
    end

    def filter_by_kind_corruption
      @characterizations_filter.where("kind_corruption like ?", "%#{@kind_corruption}%")
    end

    def filter_by_rights_violated
      @characterizations_filter.where("rights_violated like ?", "%#{@rights_violated}%")
    end

    def filter_by_affected_sector
      @characterizations_filter.where("affected_sector like ?", "%#{@affected_sector}%" )
    end

    def filter_by_crime
      @characterizations_filter.where("crime like ?", "%#{@crime}%" )
    end


    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
