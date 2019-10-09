class AddDefaultWeightToExcercises < ActiveRecord::Migration[5.2]
  def change
    add_column :excercises, :default_weight, :float, default: 0.0, null: false
  end
end
