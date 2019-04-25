class RenameExcersisesToExcercises < ActiveRecord::Migration[5.2]
  def change
  	rename_table :act_of_excersises, :act_of_excercises
  end
end
