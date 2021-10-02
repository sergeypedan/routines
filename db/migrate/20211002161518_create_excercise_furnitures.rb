class CreateExcerciseFurnitures < ActiveRecord::Migration[6.1]
  def change
    create_table :excercise_furnitures do |t|
      t.string :name_en, null: false
      t.string :name_ru, null: false
      t.timestamps
    end

    add_index :excercise_furnitures, :name_en, unique: true
    add_index :excercise_furnitures, :name_ru, unique: true
  end
end
