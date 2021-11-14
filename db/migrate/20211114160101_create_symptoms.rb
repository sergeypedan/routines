class CreateSymptoms < ActiveRecord::Migration[6.1]
  def change
    create_table :symptoms do |t|
      t.string  :title, null: false
      t.text    :description
      t.integer :duration_value
      t.string  :duration_unit, null: false

      t.timestamps
    end
  end
end
