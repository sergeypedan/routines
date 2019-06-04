# frozen_string_literal: true

class Habit::TimeBased

	def initialize(ar_habit)
		@habit = ar_habit
	end

	delegate :created_at, to: :@habit

	def target_time
		Duration.new (@habit.time_per_round * @habit.rounds_per_day), @habit.time_unit
	end

	def target_str
		"#{target_time.in(@habit.time_unit)} #{@habit.time_unit}"
	end

	def time_based?
		true
	end

end
