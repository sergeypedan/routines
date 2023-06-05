class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.references :food, null: false, foreign_key: true
      t.integer :weight

      t.timestamps
    end
  end
end
