# frozen_string_literal: true

class Habit::TimeBased

	def initialize(habit)
		@habit = habit
	end

	# delegate :created_at, to: :@habit

	def target_str
		@habit.duration.in_s @habit.time_unit
	end

	def time_based?
		true
	end

end
