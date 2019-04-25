class AddDefaultRepsCountToExcercisings < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :excercisings, :repetitions_count, 1
  end
end
