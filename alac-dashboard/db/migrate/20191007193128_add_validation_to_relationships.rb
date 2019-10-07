class AddValidationToRelationships < ActiveRecord::Migration[5.1]
  def change
    add_index :relationships, [:actor_id, :characterization_id], unique: true
  end
end
