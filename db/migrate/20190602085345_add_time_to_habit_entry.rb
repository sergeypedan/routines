class AddTimeToHabitEntry < ActiveRecord::Migration[5.2]
  def up
    add_column :habit_entries, :time, :integer, default: 0
    HabitEntry.update_all(time: 0)
    change_column_null :habit_entries, :time, false
  end

  def down
    remove_column :habit_entries, :time
  end
end
