class AddEnergyToMoods < ActiveRecord::Migration[5.2]
  def change
    add_column :moods, :energy,     :integer, limit: 3, default: 50
    add_column :moods, :positivity, :integer, limit: 3, default: 50
  end
end
