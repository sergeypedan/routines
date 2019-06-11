class FillHabitUserIds < ActiveRecord::Migration[5.2]
  def change
  	return if User.count.zero?
  	Habit.where(user_id: nil).update_all(user_id: User.first.id)
  end
end
