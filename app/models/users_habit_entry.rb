class UsersHabitEntry < ApplicationRecord
  belongs_to :user
  belongs_to :habit_entry
end
