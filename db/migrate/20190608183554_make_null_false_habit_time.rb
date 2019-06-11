class MakeNullFalseHabitTime < ActiveRecord::Migration[5.2]
  def change
  	Habit.where(time_per_round: nil).update_all(time_per_round: 0)
  	change_column_default :habits, :time_per_round, 0
  	change_column_null :habits, :time_per_round, false
  end
end
