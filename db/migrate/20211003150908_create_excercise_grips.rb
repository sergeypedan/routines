class CreateExcerciseGrips < ActiveRecord::Migration[6.1]
  def change
    create_table :excercise_grips do |t|
      t.string :name_en, null: false
      t.string :name_ru, null: false
      t.timestamps
    end

    add_index :excercise_grips, :name_en, unique: true
    add_index :excercise_grips, :name_ru, unique: true
  end
end
