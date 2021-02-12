class AddFlavorsToExcercises < ActiveRecord::Migration[6.0]
  def change
    add_column :excercises, :flavor_en, :string
    add_column :excercises, :flavor_ru, :string
  end
end
