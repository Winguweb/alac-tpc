class CreateTool < ActiveRecord::Migration[5.1]
  def change
    create_table :tools, id: :uuid do |t|
    	t.references :advisory, foreign_key: true, type: :uuid
     	t.string   :tools_used
     	t.boolean   :go_entity
     	t.string   :entity
     	t.date   :radication_date
     	t.date   :deadline
     	t.boolean   :have_answer
     	t.date   :answer_date
     	t.string :document
    end
  end
end
