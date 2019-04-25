class SwitchExcercisingToDates < ActiveRecord::Migration[5.2]
  def change
		remove_column :excercisings, :datetime, :datetime
		add_column :excercisings, :date, :date, null: false
  end
end
