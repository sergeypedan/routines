# frozen_string_literal: true

class Habit::RoundsBased

	def initialize(habit)
		@habit = habit
	end

	# delegate :created_at, to: :@habit

	def target_str
		"#{@habit.rounds_per_day} rounds"
	end

	def time_based?
		false
	end

end
