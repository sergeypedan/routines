class AddAngleMaxToExcercises < ActiveRecord::Migration[6.1]
  def change
    add_column :excercises, :angle_max, :integer, limit: 3
  end
end
