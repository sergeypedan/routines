class CreateExcercises < ActiveRecord::Migration[5.2]
  def change
    create_table :excercises do |t|
      t.string :name, null: false
      t.integer :repetitions_count, null: false
      t.integer :repetitions_count_default
      t.integer :time
      t.integer :time_default

      t.timestamps
    end
  end
end
