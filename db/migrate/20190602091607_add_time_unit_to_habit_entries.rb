class AddTimeUnitToHabitEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :habit_entries, :time_unit, :string, default: "minutes", null: false
  end
end
