class ChangeKindResponsabityToString < ActiveRecord::Migration[5.1]
  def change
    change_column :characterizations, :kind_responsability, :string
  end
end
