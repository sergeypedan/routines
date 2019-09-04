class AddMeasurementGroupIdToHealthMarkers < ActiveRecord::Migration[5.2]
  def change
  	Measurement.destroy_all
  	HealthMarker.destroy_all
    add_reference :health_markers, :measurements_group, foreign_key: true
    change_column_null :health_markers, :measurements_group_id, false
  end
end
