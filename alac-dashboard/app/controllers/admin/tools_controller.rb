module Admin
  class ToolsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Tool.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Tool.find_by!(slug: param)
    # end
    def create
      @tool = Tool.new(tool_params)
      if @tool.save
        redirect_to "/admin/reports/#{Tool.last.advisory.characterization.case_id}"
      end
    end

    def tool_params
      params.fetch(:tool, {}).permit(:advisory_id, :tools_used, :go_entity,:entity, :radication_date, :deadline, :have_answer, :answer_date, :document)
    end
    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
