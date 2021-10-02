class AddFurnitureIdToExcercises < ActiveRecord::Migration[6.1]
  def change
    add_reference :excercises, :furniture, foreign_key: { to_table: :excercise_furnitures }
  end
end
