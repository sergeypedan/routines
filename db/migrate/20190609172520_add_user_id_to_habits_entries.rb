class AddUserIdToHabitsEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :habit_entries, :user, foreign_key: true
    return if User.count.zero?
  	HabitEntry.where(user_id: nil).update_all(user_id: User.first.id)
  	change_column_null :habit_entries, :user_id, false
  end
end
