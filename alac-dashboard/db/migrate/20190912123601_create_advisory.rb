class CreateAdvisory < ActiveRecord::Migration[5.1]
  def change
    create_table :advisories, id: :uuid do |t|
      t.references :characterization, foreign_key: true, type: :uuid
      t.date   :tracking_date
      t.string   :kind_answer
      t.text   :summary
    end
  end
end
