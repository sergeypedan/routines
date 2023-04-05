class AddMovementDirectionToExcercises < ActiveRecord::Migration[6.1]
  def change
    add_column :excercises, :movement_direction, :string
  end
end
