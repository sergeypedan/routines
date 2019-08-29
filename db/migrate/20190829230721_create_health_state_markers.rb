class CreateHealthStateMarkers < ActiveRecord::Migration[5.2]
  def change
    create_table :health_state_markers do |t|
      t.string :name_en, null: false
      t.string :name_ru, null: false
      t.string :unit, null: false
      t.float :healthy_value_min, null: false
      t.float :healthy_value_max, null: false
      t.string :healthy_value_source_name
      t.string :healthy_value_source_url

      t.timestamps
    end
  end
end
