# frozen_string_literal: true

class DayHabit

	attr_reader :date

	def initialize(date:, habit:)
		@date  = date.to_date
		@habit = habit
		@specific_habit = time_based? ? Habit::TimeBased.new(@habit) : Habit::RoundsBased.new(@habit)
	end

	def applicable?
		@date >= @habit.created_at
	end

	def completed?
		return done_rounds            >= target_rounds if rounds_based?
		return done_time.in(:seconds) >= target_time.in(:seconds)
	end

	def completed_fraction
		return done_rounds.to_f            / target_rounds.to_f if rounds_based?
		return done_time.in(:seconds).to_f / target_time.in(:seconds).to_f
	end

	def completed_percent
		completed_fraction * 100
	end

	attr_reader :date

	def done_rounds
		@done_rounds ||= entries.size
	end

	def done_time
		@done_time ||= if time_based?
											amount = (entries.map(&:duration).map(&:seconds).reduce(&:+)) || 0
											Duration.new amount, :seconds
										else
											Duration.new 0, :seconds
										end
	end

	def entries
		@entries ||= @habit.entries.where(created_at: @date.all_day)
	end

	def exceeded?
		completed_fraction > 1
	end

	def habit
		@habit
	end

	delegate :rounds_based?, to: :@habit

	def target_rounds
		@habit.rounds_per_day
	end

	delegate :target_str, to: :@specific_habit

	def target_time
		@habit.duration
	end

	delegate :rounds_based?, to: :@habit
	delegate :time_based?,   to: :@habit

end
