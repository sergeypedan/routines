class AddNameEnToExcercises < ActiveRecord::Migration[6.0]
  def change
    add_column :excercises, :name_en, :string
  end
end
