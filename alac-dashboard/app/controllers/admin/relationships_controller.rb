module Admin
  class RelationshipsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Relationship.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Relationship.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def create
      resource = resource_class.new(resource_params)
      authorize_resource(resource)

      if resource.save
        flash[:notice] = translate_with_resource("create.success")
      else
        flash[:error] = "La relacion ya ha sido creada"
      end

      redirect_back fallback_location: root_path
    end

    def destroy
      if requested_resource.destroy
        flash[:notice] = translate_with_resource("destroy.success")
      else
        flash[:error] = requested_resource.errors.full_messages.join("<br/>")
      end
      redirect_back fallback_location: root_path
    end
  end
end
