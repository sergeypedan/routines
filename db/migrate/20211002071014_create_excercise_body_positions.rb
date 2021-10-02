class CreateExcerciseBodyPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :excercise_body_positions do |t|
      t.string :name_en, null: false
      t.string :name_ru, null: false
      t.timestamps
    end

    add_index :excercise_body_positions, :name_en, unique: true
    add_index :excercise_body_positions, :name_ru, unique: true
  end
end
