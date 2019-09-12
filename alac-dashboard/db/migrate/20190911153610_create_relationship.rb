class CreateRelationship < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships, id: :uuid do |t|
      t.references :actor, foreign_key: true, type: :uuid
      t.references :characterization, foreign_key: true, type: :uuid
      t.string  :participation_type
      t.timestamps null: false
    end
  end
end
