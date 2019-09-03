class RenameHealthStateMarkers < ActiveRecord::Migration[5.2]
  def change
  	rename_table :health_state_markers, :health_markers
  end
end
