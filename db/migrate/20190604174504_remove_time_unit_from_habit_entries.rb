class RemoveTimeUnitFromHabitEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :habit_entries, :time_unit, :string
  end
end
