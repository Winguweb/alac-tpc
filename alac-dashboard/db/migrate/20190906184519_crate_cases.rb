class CrateCases < ActiveRecord::Migration[5.1]
  def change
  	create_table :cases, id: :uuid do |t|
      t.string   :report_id
      t.string   :responsability_class
      t.string   :type
      t.string   :crime
      t.string   :category
      t.string   :sector
      t.string   :ambit
      t.string   :rights
      t.boolean   :present_auth
      t.string   :authority
      t.string  :other
      t.timestamps null: false
    end
  end
end
