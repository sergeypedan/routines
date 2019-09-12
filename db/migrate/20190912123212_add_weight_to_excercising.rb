class AddWeightToExcercising < ActiveRecord::Migration[5.2]
  def change
    add_column :excercisings, :weight, :float, default: 0.0, null: false
  end
end
