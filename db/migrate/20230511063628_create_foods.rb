class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name_en
      t.string :name_ru
      t.integer :kcal_in_100_g
      t.decimal :protein_in_100_g
      t.decimal :carbs_in_100_g
      t.decimal :fats_in_100_g

      t.timestamps
    end

    add_index :foods, :name_en, unique: true
    add_index :foods, :name_ru, unique: true
  end
end
