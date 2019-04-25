class RenameActOfExcercisesToExcercisings < ActiveRecord::Migration[5.2]
  def change
  	rename_table :act_of_excercises, :excercisings
  end
end
