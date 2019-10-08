module Admin
  class AdvisoriesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Advisory.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Advisory.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

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
