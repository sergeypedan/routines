# frozen_string_literal: true

class WorkoutsController < DashboardsController

	before_action :set_resource, only: [:destroy, :duplicate, :edit, :update, :yesterday]
	before_action :load_muscles, only: [:new, :edit]


	def index
		@workouts = Workout.includes(excercise: [:main_muscle, :muscles]).order({ date: :desc })
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
