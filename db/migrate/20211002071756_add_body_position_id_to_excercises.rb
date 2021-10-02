class AddBodyPositionIdToExcercises < ActiveRecord::Migration[6.1]
  def change
    add_reference :excercises, :body_position, foreign_key: { to_table: :excercise_body_positions }
  end
end
