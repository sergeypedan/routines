class AddMeasurementObjectIdToHealthMarkers < ActiveRecord::Migration[5.2]
  def change
    add_reference :health_markers, :measurement_object, foreign_key: true
  end
end
