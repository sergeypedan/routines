class AddSimultaneouslyToExcercises < ActiveRecord::Migration[6.1]
  def change
    add_column :excercises, :simultaneously, :boolean
  end
end
