class AddWhyToMoodEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :mood_entries, :why, :text
    add_column :mood_entries, :comment, :text
  end
end
