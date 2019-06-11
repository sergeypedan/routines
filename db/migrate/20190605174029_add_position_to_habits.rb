class AddPositionToHabits < ActiveRecord::Migration[5.2]
  def change
    add_column :habits, :position, :integer, default: 0, null: false
    add_index :habits, :position
  end
end
