class AddDefaultsToExcercises < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :excercises, :default_repetitions_count, 15
  	change_column_default :excercises, :default_time, 60
  end
end
