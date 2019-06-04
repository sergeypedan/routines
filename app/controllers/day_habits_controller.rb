# frozen_string_literal: true

class DayHabitsController < ApplicationController

  # /day_habits/
  # /day_habits/?date=today
  # /day_habits/?date=yesterday
  # /day_habits/?date=2019-05-29
  def index
    @date = case params[:date]
            when "today" then Date.today
            when "yesterday" then Date.today.advance(days: -1)
            else Date.today
            end
    @day_habits = Habit.all.map { |habit| DayHabit.new(date: @date, habit: habit) }
  end

  # /day_habits/2019-05-29?habit_id=1
  def show
    @date      = Date.parse params[:date]
    @habit     = Habit.find params[:habit_id]
    @day_habit = DayHabit.new(date: @date, habit: Habit.first)
  end

end
