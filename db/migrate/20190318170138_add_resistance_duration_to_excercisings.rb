class AddResistanceDurationToExcercisings < ActiveRecord::Migration[5.2]
  def change
  	add_column :excercisings, :resistance_duration, :integer, comment: "In seconds"
  end
end
