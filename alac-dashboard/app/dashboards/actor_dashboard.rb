require "administrate/base_dashboard"

class ActorDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.Field::Select.with_options(collection: [:foo, :baz])
  ATTRIBUTE_TYPES = {
    id: Field::String.with_options(searchable: false),
    name: Field::String,
    last_name: Field::String,
    individual_actor_type: Field::Select.with_options(
      collection:["Actor privado con funciones públicas por colaboración","Actor vinculado a economía ilegal","Altos dignatarios","Autoridad Electa por votación propular","Director/Trabajador caja de compensación familiar","Miembro de Grupo armado ilegal","Miembro de la fuerza pública","Miembro de partido político,movimiento y/o grupo significativo de ciudadanos","Miembro del tercer Sector","No aplica","No disponible","Otros","Servidores públicos"]# Any array of choices. Add blank yourself if you need it.
    ),
    individual_actor_cat_1: Field::String,
    individual_actor_cat_2: Field::String,
    colective_actor_type: Field::String,
    colective_actor_cat_1: Field::String,
    colective_actor_cat_2: Field::String,
    institution: Field::String,
    public_branch: Field::String,
    position: Field::String,
    entity: Field::String,
    public_auth: Field::Boolean,
    no_name: Field::Boolean,
    status: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :last_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :last_name,
    :individual_actor_type,
    :individual_actor_cat_1,
    :individual_actor_cat_2,
    :colective_actor_type,
    :colective_actor_cat_1,
    :colective_actor_cat_2,
    :institution,
    :public_branch,
    :position,
    :entity,
    :public_auth,
    :no_name,
    :status,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :last_name,
    :individual_actor_type,
    :individual_actor_cat_1,
    :individual_actor_cat_2,
    :colective_actor_type,
    :colective_actor_cat_1,
    :colective_actor_cat_2,
    :institution,
    :public_branch,
    :position,
    :entity,
    :public_auth,
    :no_name,
    :status,
  ].freeze

  # Overwrite this method to customize how actors are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(actor)
  #   "Actor ##{actor.id}"
  # end
end
