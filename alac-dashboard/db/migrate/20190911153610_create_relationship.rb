class CreateRelationship < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships, id: :uuid do |t|
      t.references :actor, foreign_key: true
      t.references :case, foreign_key: true
    end
  end
end
