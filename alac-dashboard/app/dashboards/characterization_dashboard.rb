require "administrate/base_dashboard"

class CharacterizationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    evolutions: Field::HasMany,
    advisories: Field::HasMany,
    relationships: Field::HasMany,
    actors: Field::HasMany,
    id: Field::String.with_options(searchable: false),
    case_id: Field::String,
    summary: Field::Text,
    status: Field::String,
    known_authority: Field::Boolean,
    authority: Field::String,
    has_tool: Field::Boolean,
    tool: Field::String,
    scope: Field::String,
    kind_corruption: Field::String,
    affected_area: Field::String,
    affected_sector: Field::String,
    rights_violated: Field::String,
    kind_responsability: Field::Boolean,
    crime: Field::String,
    have_material: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :evolutions,
    :advisories,
    :relationships,
    :actors,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :evolutions,
    :advisories,
    :relationships,
    :actors,
    :id,
    :case_id,
    :summary,
    :status,
    :known_authority,
    :authority,
    :has_tool,
    :tool,
    :scope,
    :kind_corruption,
    :affected_area,
    :affected_sector,
    :rights_violated,
    :kind_responsability,
    :crime,
    :have_material,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    # :evolutions,
    # :advisories,
    # :relationships,
    :actors,
    :case_id,
    :summary,
    :status,
    :known_authority,
    :authority,
    :has_tool,
    :tool,
    :scope,
    :kind_corruption,
    :affected_area,
    :affected_sector,
    :rights_violated,
    :kind_responsability,
    :crime,
    :have_material,
  ].freeze

  # Overwrite this method to customize how characterizations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(characterization)
  #   "Characterization ##{characterization.id}"
  # end
end
