# frozen_string_literal: true

class DayHabitsController < DashboardsController

	# /day_habits/
	# /day_habits/?date=today
	# /day_habits/?date=yesterday
	# /day_habits/?date=2019-05-29
	def index
		today = Time.current.to_date
		@date = case params[:date]
						when nil         then today
						when "today"     then today
						when "yesterday" then today.advance(days: -1)
						else Date.parse params[:date]
						end
		@day_habits = Habit.order(:position).map do |habit|
										DayHabit.new(date: @date, habit: habit)
									end
	end

	# /day_habits/2019-05-29?habit_id=1
	def show
		@date      = Date.parse params[:date]
		@habit     = Habit.find params[:habit_id]
		@day_habit = DayHabit.new(date: @date, habit: @habit)
	end

	# /day_habits/increment_habit_entries?habit_id=1&date=2019-05-25
	# def increment_habit_entries
	#   filtered_params = params.permit(:date, :habit_id)
	# end

end
