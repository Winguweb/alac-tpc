require "administrate/base_dashboard"

class CaseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::String.with_options(searchable: false),
    report_id: Field::String,
    responsability_class: Field::String,
    type: Field::String,
    crime: Field::String,
    category: Field::String,
    sector: Field::String,
    ambit: Field::String,
    rights: Field::String,
    present_auth: Field::Boolean,
    authority: Field::String,
    other: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :report_id,
    :responsability_class,
    :type,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :report_id,
    :responsability_class,
    :type,
    :crime,
    :category,
    :sector,
    :ambit,
    :rights,
    :present_auth,
    :authority,
    :other,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :report_id,
    :responsability_class,
    :type,
    :crime,
    :category,
    :sector,
    :ambit,
    :rights,
    :present_auth,
    :authority,
    :other,
  ].freeze

  # Overwrite this method to customize how cases are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(case)
  #   "Case ##{case.id}"
  # end
end
