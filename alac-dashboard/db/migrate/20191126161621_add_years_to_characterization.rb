class AddYearsToCharacterization < ActiveRecord::Migration[5.1]
  def change
    add_column :characterizations, :end_year, :integer
    add_column :characterizations, :start_year, :integer
  end
end
