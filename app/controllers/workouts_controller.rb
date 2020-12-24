# frozen_string_literal: true

class WorkoutsController < DashboardsController

	DAYS_TO_SHOW_UPFRONT = { desktop: 3, mobile: 3 }

	before_action :set_resource, only: [:destroy, :duplicate, :edit, :update, :yesterday]
	before_action :load_muscles, only: [:new, :edit]


	def upfront_dates
		dates_count = DAYS_TO_SHOW_UPFRONT.fetch(at_mobile? ? :mobile : :desktop)
		Workout.select(:date).distinct.order(date: :desc).limit(dates_count).pluck(:date)
	end


	def index
		scope = Workout.includes(excercise: [:main_muscle, :muscles]).order({ date: :desc })
    if params[:rest].present?
  		@workouts = scope.where.not(date: upfront_dates)
  		render "_days_#{at_mobile? ? "mobile" : "desktop"}", layout: false
    else
      @workouts = scope.where(date: upfront_dates)
      render :index_mobile if at_mobile?
    end
	end


	def new
		@workout = Workout.new(date: Date.today)
		render :edit
	end


	def edit
	end


	def create
		@workout = Workout.new(filtered_params)
		if @workout.save
			redirect_to workouts_path, notice: "Created"
		else
			render :edit
		end
	end


	def update
		if @workout.update(filtered_params)
			redirect_to workouts_path, notice: "Updated"
		else
			render :edit
		end
	end


	def destroy
		@workout.destroy
		redirect_to workouts_path, notice: "Deleted"
	end


	def duplicate
		Workout.create(@workout.attributes.except("id", "created_at", "date", "updated_at").merge({ date: Time.current.to_date }))
		redirect_to workouts_path
	end


	def yesterday
		@workout.update(date: Date.yesterday)
		redirect_to workouts_path
	end


	private


	def set_resource
		@workout = Workout.find params[:id]
	end


	def filtered_params
		params
			.require(:workout)
			.permit(
				:date,
				:excercise_id,
				:repetitions_count,
				:resistance_duration,
				:weight
			)
	end

	def load_muscles
		@muscles = Muscle.includes(:targeted_excercises)
	end

end
