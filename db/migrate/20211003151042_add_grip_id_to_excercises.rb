class AddGripIdToExcercises < ActiveRecord::Migration[6.1]
  def change
    add_reference :excercises, :grip, foreign_key: { to_table: :excercise_grips }
  end
end
