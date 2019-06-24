class CreateMoodEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :mood_entries do |t|
      t.references :mood, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
