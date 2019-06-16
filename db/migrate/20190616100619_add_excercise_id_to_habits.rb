class AddExcerciseIdToHabits < ActiveRecord::Migration[5.2]
  def change
    add_reference :habits, :excercise, foreign_key: true
  end
end
