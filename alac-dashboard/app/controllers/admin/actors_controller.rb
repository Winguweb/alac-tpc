module Admin
  class ActorsController < Admin::ApplicationController
    include ActorsOptionsHelper
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Actor.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Actor.find_by!(slug: param)
    # end

    def new 
      @get_options = get_options 
      super
      @resources = Actor.new
      
    end
    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
