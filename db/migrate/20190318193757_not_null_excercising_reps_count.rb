class NotNullExcercisingRepsCount < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :excercisings, :repetitions_count, false
  	change_column_null :excercisings, :excercise_id, false
  end
end
