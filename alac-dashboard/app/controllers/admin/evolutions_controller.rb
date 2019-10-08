module Admin
  class EvolutionsController < Admin::ApplicationController
    include SelectHelper
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Evolution.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Evolution.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
    
    def edit
      @actors_select = Actor.all
      @get_options = get_options
      super
    end

    def update
      if requested_resource.update(resource_params)
        redirect_to(
          '/admin/reports/' + requested_resource.characterization.case_id, { notice: translate_with_resource("update.success") } )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, requested_resource),
        }
      end
    end
  end
end
