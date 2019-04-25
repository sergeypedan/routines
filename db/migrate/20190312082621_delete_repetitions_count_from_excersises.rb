class DeleteRepetitionsCountFromExcersises < ActiveRecord::Migration[5.2]
  def change
  	remove_column :excercises, :repetitions_count, :integer
  	remove_column :excercises, :time, :integer
  end
end
