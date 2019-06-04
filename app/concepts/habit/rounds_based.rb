# frozen_string_literal: true

class Habit::RoundsBased

	def initialize(ar_habit)
		@habit = ar_habit
	end

	delegate :created_at, to: :@habit

	def target_rounds
		@habit.rounds_per_day
	end

	def target_str
		"#{target_rounds} rounds"
	end

	def time_based?
		false
	end

end
