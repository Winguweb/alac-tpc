class CreateCharacterization < ActiveRecord::Migration[5.1]
  def change
    create_table :characterizations, id: :uuid do |t|
      t.string   :case_id, null: false
      t.text   :summary
      t.string   :status
      t.boolean   :known_authority
      t.string   :authority
      t.boolean   :has_tool
      t.string   :tool
      t.string   :scope
      t.string   :kind_corruption
      t.string   :affected_area
      t.string  :affected_sector
      t.string   :rights_violated
      t.boolean   :kind_responsability
      t.string  :crime
      t.boolean :have_material
      t.timestamps null: false
    end
  end
end
