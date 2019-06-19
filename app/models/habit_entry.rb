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
#
# Table name: habit_entries
#
#  habit_id         :bigint
#  id               :bigint           not null, primary key
#  time(in seconds) :integer          default(0), not null
#  user_id          :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (habit_id => habits.id)
#  fk_rails_...  (user_id => users.id)
#
