require "administrate/base_dashboard"

class ToolDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    advisory: Field::BelongsTo,
    id: Field::String.with_options(searchable: false),
    tools_used: Field::String,
    go_entity: Field::Boolean,
    entity: Field::String,
    radication_date: Field::DateTime,
    deadline: Field::DateTime,
    have_answer: Field::Boolean,
    answer_date: Field::DateTime,
    document: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :advisory,
    :id,
    :tools_used,
    :go_entity,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :advisory,
    :id,
    :tools_used,
    :go_entity,
    :entity,
    :radication_date,
    :deadline,
    :have_answer,
    :answer_date,
    :document,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :advisory,
    :tools_used,
    :go_entity,
    :entity,
    :radication_date,
    :deadline,
    :have_answer,
    :answer_date,

  ].freeze

  # Overwrite this method to customize how tools are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(tool)
  #   "Tool ##{tool.id}"
  # end
end
