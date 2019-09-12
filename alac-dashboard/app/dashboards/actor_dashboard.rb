require "administrate/base_dashboard"

class ActorDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    relationships: Field::HasMany,
    characterizations: Field::HasMany,
    id: Field::String.with_options(searchable: false),
    name: Field::String,
    last_name: Field::String,
    general_type: Field::String,
    category: Field::String,
    subtype: Field::String,
    subtype_2: Field::String,
    institution: Field::String,
    public_branch: Field::String,
    position: Field::String,
    entity: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :relationships,
    :characterizations,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :relationships,
    :characterizations,
    :id,
    :name,
    :last_name,
    :general_type,
    :category,
    :subtype,
    :subtype_2,
    :institution,
    :public_branch,
    :position,
    :entity,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :relationships,
    # :characterizations,
    :name,
    :last_name,
    :general_type,
    :category,
    :subtype,
    :subtype_2,
    :institution,
    :public_branch,
    :position,
    :entity,
  ].freeze

  # Overwrite this method to customize how actors are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(actor)
  #   "Actor ##{actor.id}"
  # end
end
