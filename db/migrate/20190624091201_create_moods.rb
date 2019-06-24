class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.string :name_en, null: false
      t.string :name_ru, null: false

      t.timestamps
    end
  end
end
