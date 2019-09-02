module LayoutHelper
  def body_id
    "#{controller.controller_name}_#{controller.action_name}"
  end

  def body_class
    "#{controller.controller_name}-#{controller.action_name}"
  end
end
