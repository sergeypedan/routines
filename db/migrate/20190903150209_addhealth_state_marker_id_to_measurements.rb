class AddhealthStateMarkerIdToMeasurements < ActiveRecord::Migration[5.2]
  def change
  	add_reference :measurements,
							  	:marker,
							  	index: true,
							  	foreign_key: { to_table: :health_state_markers, column_name: :id }
  end
end
