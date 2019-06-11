class AddCommentToHabitEntry < ActiveRecord::Migration[5.2]
  def up
  	change_column :habit_entries, :time, :integer, null: false, default: 0, comment: "in seconds"
  end

  def down
  	change_column :habit_entries, :time, :integer, null: false, default: 0
  end
end
