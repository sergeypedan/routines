# frozen_string_literal: true

class HabitsController < DashboardsController

	skip_before_action :verify_authenticity_token, only: [:move]


  def index
    @habits = Habit.all.order(:position)
  end


  def new
    @habit = Habit.new(user_id: current_user.id)
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


	def move
		@habit = Habit.find params[:id]
		@habit.move_to! params[:position]
	end


  private

  def filtered_params
    params.require(:habit).permit(:id, :name, :position, :rounds_per_day, :time_per_round, :time_unit, :user_id)
  end

end
