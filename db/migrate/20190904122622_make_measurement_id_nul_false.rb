class MakeMeasurementIdNulFalse < ActiveRecord::Migration[5.2]
  def change
  	measurement_object = MeasurementObject.create(name_en: "Blood", name_ru: "Кровь")
  	HealthMarker.update_all(measurement_object_id: measurement_object.id)

  	change_column_null :health_markers, :measurement_object_id, false
  end
end
