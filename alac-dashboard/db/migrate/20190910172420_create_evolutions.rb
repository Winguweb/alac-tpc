class CreateEvolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :evolutions, id: :uuid do |t|
      t.references :characterization, foreign_key: true, type: :uuid
      t.references :actor, foreign_key: true, type: :uuid
      t.date   :presentation_date
      t.date   :sanction_date
      t.string   :kind_investigation
      t.string   :stage
      t.string  :situation
      t.string  :fault
      t.string  :authority
      t.string  :crime
      t.text  :details
      t.text  :comment
      t.timestamps null: false
    end
  end
end
