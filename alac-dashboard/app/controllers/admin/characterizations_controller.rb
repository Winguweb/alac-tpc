module Admin
  class CharacterizationsController < Admin::ApplicationController
    include MainHelper
    include SelectHelper
    helper_method :characterization_form_options, :corruption_options, :rights_violated
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      super
      allowed_params = allowed_index_params
      binding.pry
        @resources = Characterization.
          page(params[:page]).
          per(10)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Characterization.find_by!(slug: param)
    # end

    def allowed_index_params
      allowed_params = params.permit(:status, :scope, :kind_corruption, :rights_violated)
      allowed_params.reject{ |_, v| v.blank? }
    end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
