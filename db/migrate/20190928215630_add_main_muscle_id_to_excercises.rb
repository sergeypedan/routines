class AddMainMuscleIdToExcercises < ActiveRecord::Migration[5.2]
  def change
    add_reference :excercises, :main_muscle, foreign_key: { to_table: :muscles }, index: true
  end
end
