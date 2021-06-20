class AddMuscleNameUniqIndices < ActiveRecord::Migration[6.0]
  def change
    add_index :muscles, :name, unique: true
  end
end
