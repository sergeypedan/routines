class AddRepetitionBasedToExcercises < ActiveRecord::Migration[5.2]
  def change
    add_column :excercises, :repetition_based, :boolean, default: true
  end
end
