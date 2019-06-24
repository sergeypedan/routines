class AddIndexToMoods < ActiveRecord::Migration[5.2]
  def change
    add_index :moods, :name_en, unique: true
    add_index :moods, :name_ru, unique: true
  end
end
