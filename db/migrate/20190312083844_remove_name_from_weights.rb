class RemoveNameFromWeights < ActiveRecord::Migration[5.2]
  def change
    remove_column :weights, :name, :string
  end
end
