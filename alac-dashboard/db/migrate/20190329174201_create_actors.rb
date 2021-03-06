class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors, id: :uuid do |t|
      t.string   :name
      t.string   :last_name
      t.string   :general_type
      t.string   :category
      t.string   :subtype
      t.string   :subtype_2
      t.string   :institution
      t.string   :public_branch
      t.string   :position
      t.string   :entity
      t.timestamps null: false
    end
  end
end
