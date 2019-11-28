module Admin
  class CharacterizationsController < Admin::ApplicationController
    include MainHelper
    include SelectHelper
    helper_method :characterization_form_options, :corruption_options, :rights_violated
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      allowed_params = allowed_index_params
      @status = allowed_params[:status]
      @scope = allowed_params[:scope]
      @kind_corruption = allowed_params[:kind_corruption]
      @rights_violated = allowed_params[:rights_violated]
      @characterizations = Characterization.all
      @resources = characterization_finder
      @resources.page(params[:page]).per(10)
      super

    end

    private

    def allowed_index_params
      allowed_params = params.permit(:status, :scope, :kind_corruption, :rights_violated)
      allowed_params.reject{ |_, v| v.blank? }
    end

    def characterization_finder
      @characterizations_filter = @characterizations
      @characterizations_filter = filter_by_status if @status
      @characterizations_filter = filter_by_scope if @scope
      @characterizations_filter
    end

    def filter_by_status
      @characterizations_filter.where(status: @status)
    end

    def filter_by_scope
      @characterizations_filter.where(scope: @scope)
    end


    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
