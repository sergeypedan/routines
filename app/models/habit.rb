# frozen_string_literal: true

class Habit < ApplicationRecord

	# Constants

	TIME_IDS = ["hours", "minutes", "seconds"].freeze


	# Validations

	validates :name, presence: true
	validates :rounds_per_day, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :time_per_round, allow_blank: true, numericality: { only_integer: true, greater_than: 0 }
	validates :time_unit, presence: true, inclusion: { in: TIME_IDS }


	# Associaitons

	has_many :habit_entries


	# Methods

	def duration
		@duration ||= begin
		                time = time_based? ? (time_per_round * rounds_per_day) : 0
		                Duration.new(time, time_unit)
		              end
	end

	def time_based?
		self.time_per_round&.positive?
	end

	def self.time_units_for_radios
		[
			["hours",   "Hours"],
			["minutes", "Minutes"],
			["seconds", "Seconds"]
		]
	end

	def self.time_units_for_select
		[
			["Hours",   "hours"],
			["Minutes", "minutes"],
			["Seconds", "seconds"]
		]
	end

end

# == Schema Information
#
# Table name: habits
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  rounds_per_day :integer          default(1), not null
#  time_per_round :integer
#  time_unit      :string           default("minutes"), not null
#
