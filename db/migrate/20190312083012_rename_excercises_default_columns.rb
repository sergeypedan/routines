class RenameExcercisesDefaultColumns < ActiveRecord::Migration[5.2]
  def change
  	rename_column :excercises, :time_default, :default_time
  	rename_column :excercises, :repetitions_count_default, :default_repetitions_count
  end
end
