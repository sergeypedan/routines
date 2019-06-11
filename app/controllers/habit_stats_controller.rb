# frozen_string_literal: true

class HabitStatsController < ApplicationController

	def index
		start_date    = Date.parse(params[:from]) rescue Date.today.advance(days: -7)
		end_date      = Date.parse(params[:till]) rescue Date.today
		@time_frame   = (start_date..end_date)
		@habits_stats = Habit.all.map { |habit| habit_stats_for_time_range(habit: habit, time_range: @time_frame) }
	end

	def show
		@habit       = Habit.find_by id: params[:id]
		render "errors/not_found", status: :not_found and return unless @habit
		start_date   = Date.parse(params[:from]) rescue @habit.created_at.to_date
		end_date     = Date.parse(params[:till]) rescue Date.today
		@time_frame  = (start_date..end_date)
		@habit_stats = habit_stats_for_time_range(habit: @habit, time_range: @time_frame)
	end

	private

	def habit_stats_for_time_range(habit:, time_range:)
		time_range.map { |date| DayHabit.new(date: date, habit: habit) }
	end

end
