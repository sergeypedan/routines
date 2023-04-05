class AddMovementTypeToExcercises < ActiveRecord::Migration[6.1]
  def change
    add_column :excercises, :movement_type, :string
  end
end
