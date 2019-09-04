class AddAbbrEnToHealthMarkers < ActiveRecord::Migration[5.2]
  def change
    add_column :health_markers, :abbr_en, :string, limit: 10
    add_column :health_markers, :abbr_ru, :string, limit: 10
  end
end
