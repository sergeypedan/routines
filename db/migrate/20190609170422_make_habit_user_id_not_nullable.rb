class MakeHabitUserIdNotNullable < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :habits, :user_id, false
  end
end
