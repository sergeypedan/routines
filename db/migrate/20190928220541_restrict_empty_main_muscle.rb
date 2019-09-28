class RestrictEmptyMainMuscle < ActiveRecord::Migration[5.2]
  def change
  	Excercise.update_all(main_muscle_id: Muscle.first.id)
  	change_column_null :excercises, :main_muscle_id, false
  end
end
