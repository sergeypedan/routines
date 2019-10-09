# frozen_string_literal: true

class ExcercisingsController < DashboardsController

	before_action :find_excercising, only: [:destroy, :duplicate, :edit, :update, :yesterday]
	before_action :load_muscles, only: [:new, :edit]


	def index
		@excercisings = Excercising.includes(excercise: [:main_muscle, :muscles]).order({ date: :desc })
	end


	def new
		@excercising = Excercising.new(date: Date.today)
		render :edit
	end


	def edit
	end


	def create
		@excercising = Excercising.new(filtered_params)
		if @excercising.save
			redirect_to excercisings_path, notice: "Created"
		else
			render :edit
		end
	end


	def update
		if @excercising.update(filtered_params)
			redirect_to excercisings_path, notice: "Updated"
		else
			render :edit
		end
	end


	def destroy
		@excercising.destroy
		redirect_to excercisings_path, notice: "Deleted"
	end


	def duplicate
		Excercising.create(@excercising.attributes.except("id", "created_at", "date", "updated_at").merge({ date: Time.current.to_date }))
		redirect_to excercisings_path
	end


	def yesterday
		@excercising.update(date: Date.yesterday)
		redirect_to excercisings_path
	end


	private


	def find_excercising
		@excercising = Excercising.find params[:id]
	end


	def filtered_params
		params
			.require(:excercising)
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
