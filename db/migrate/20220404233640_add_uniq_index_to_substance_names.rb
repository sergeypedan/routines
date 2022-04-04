class AddUniqIndexToSubstanceNames < ActiveRecord::Migration[6.1]
  def change
  	add_index :substances, :name, unique: true
  end
end
