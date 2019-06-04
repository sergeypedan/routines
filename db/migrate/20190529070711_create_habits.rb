class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.string :name, null: false
      t.integer :rounds_per_day, null: false, default: 1
      t.integer :time_per_round
      t.string :time_unit, null: false, default: "minutes"

      t.timestamps
    end
  end
end
