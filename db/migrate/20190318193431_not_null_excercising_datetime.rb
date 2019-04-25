class NotNullExcercisingDatetime < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :excercisings, :datetime, false
  end
end
