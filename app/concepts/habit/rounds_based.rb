# frozen_string_literal: true

class Habit::RoundsBased

	def initialize(habit)
		@habit = habit
	end

	# delegate :created_at, to: :@habit

	def target_str
		I18n.t :rounds, count: @habit.rounds_per_day
	end

	def time_based?
		false
	end

end
