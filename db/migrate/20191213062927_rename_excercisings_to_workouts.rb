class RenameExcercisingsToWorkouts < ActiveRecord::Migration[5.2]
  def change
    rename_table :excercisings, :workouts
  end
end
