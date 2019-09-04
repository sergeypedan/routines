class HealthMarkerDoesNotRequreMeasurementGroup < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :health_markers, :measurements_group_id, true
  end
end
