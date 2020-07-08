# frozen_string_literal: true

class HabitEntry < ApplicationRecord

	# Validations

	validates :habit_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :user_id,  presence: true, numericality: { only_integer: true, greater_than: 0 }


	# Associations

	belongs_to :habit
	belongs_to :user


	# Methods

	attr_accessor :date

	delegate :time_unit, to: :habit

	def duration
		@duration ||= Duration.new(time, :seconds)
	end

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: habit_entries
#
#  id       :bigint           not null, primary key
#  time     :integer          default(0), not null
#  habit_id :bigint
#  user_id  :bigint           not null
#
# Indexes
#
#  index_habit_entries_on_habit_id  (habit_id)
#  index_habit_entries_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (habit_id => habits.id)
#  fk_rails_...  (user_id => users.id)
#
