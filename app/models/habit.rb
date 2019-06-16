# frozen_string_literal: true

class Habit < ApplicationRecord

	# Constants

	TIME_IDS = ["hours", "minutes", "seconds"].freeze


	# Validations

	validates :excercise_id, allow_blank: true, numericality: { only_integer: true, greater_than: 0 }
	validates :name,            presence: true
	validates :rounds_per_day,  presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :time_per_round,  presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :time_unit,       presence: true, inclusion: { in: TIME_IDS }
	validates :user_id,         presence: true, numericality: { only_integer: true, greater_than: 0 }


	# Associaitons

	belongs_to :excercise, optional: true
	has_many :entries, class_name: "HabitEntry", dependent: :destroy


	# Macros

	acts_as_sortable


	# Methods

	def duration
		@duration ||= Duration.new(total_time, :seconds)
	end

	def rounds_based?
		!time_based?
	end

	def time_based?
		self.time_per_round&.positive? || false
	end

	def total_time
		time_per_round.to_i * rounds_per_day
		# `to_i` is needed here because `time_per_round` may be `nil`
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
#  excercise_id   :bigint
#  id             :bigint           not null, primary key
#  name           :string           not null
#  position       :integer          default(0), not null
#  rounds_per_day :integer          default(1), not null
#  time_per_round :integer          default(0), not null
#  time_unit      :string           default("minutes"), not null
#  user_id        :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (excercise_id => excercises.id)
#  fk_rails_...  (user_id => users.id)
#
