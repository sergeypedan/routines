# frozen_string_literal: true

class CreateMeasurementObjects < ActiveRecord::Migration[5.2]
  def change
    create_table :measurement_objects do |t|
      t.string :name_en, null: false
      t.string :name_ru, null: false

      t.timestamps
    end
  end
end
