class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors, id: :uuid do |t|
      t.string   :name
      t.string   :last_name
      t.string   :individual_actor_type
      t.string   :individual_actor_cat_1
      t.string   :individual_actor_cat_2
      t.string   :colective_actor_type
      t.string   :colective_actor_cat_1
      t.string   :colective_actor_cat_2
      t.string   :institution
      t.string   :public_branch
      t.string   :position
      t.string   :entity
      t.boolean  :public_auth
      t.boolean  :no_name
      t.boolean  :status
      t.timestamps null: false
    end
  end
end
