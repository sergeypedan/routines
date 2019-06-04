# frozen_string_literal: true

class HabitsController < ApplicationController

  def index
    @habits = Habit.all.order(created_at: :asc)
  end


  def new
    @habit = Habit.new
    render :edit
  end


  def create
    @habit = Habit.new filtered_params
    if @habit.save
      redirect_to habits_path
    else
      render :edit
    end
  end


  def edit
    @habit = Habit.find params[:id]
  end


  def update
    @habit = Habit.find params[:id]
    if @habit.update(filtered_params)
      redirect_to habits_path
    else
      render :edit
    end
  end


  def destroy
    @habit = Habit.find params[:id]
    @habit.destroy
    redirect_to habits_path
  end


  private

  def filtered_params
    params.require(:habit).permit(:id, :name, :rounds_per_day, :time_per_round, :time_unit)
  end

end
