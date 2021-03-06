require "administrate/base_dashboard"

class EvolutionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    actor: Field::BelongsTo,
    characterization: Field::BelongsTo,
    id: Field::String.with_options(searchable: false),
    presentation_date: Field::DateTime,
    sanction_date: Field::DateTime,
    kind_investigation: Field::String,
    stage: Field::String,
    situation: Field::String,
    fault: Field::String,
    authority: Field::String,
    crime: Field::String,
    details: Field::Text,
    comment: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :actor,
    :characterization,
    :id,
    :presentation_date,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :actor,
    :characterization,
    :id,
    :presentation_date,
    :sanction_date,
    :kind_investigation,
    :stage,
    :situation,
    :fault,
    :authority,
    :crime,
    :details,
    :comment,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :actor,
    :characterization,
    :presentation_date,
    :sanction_date,
    :kind_investigation,
    :stage,
    :situation,
    :fault,
    :authority,
    :crime,
    :details,
    :comment,
  ].freeze

  # Overwrite this method to customize how evolutions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(evolution)
  #   "Evolution ##{evolution.id}"
  # end
end
