class AddNullFalseToExcerciseDefaultTime < ActiveRecord::Migration[5.2]
  def change
  	Excercise.where(default_time: nil).update_all(default_time: 0)
  	change_column_null :excercises, :default_time, false

  	Excercise.where(default_repetitions_count: nil).update_all(default_repetitions_count: 1)
  	change_column_null :excercises, :default_repetitions_count, false
  end
end
