# frozen_string_literal: true

class ExcercisesController < DashboardsController

	before_action :set_excercise, only: [:edit, :destroy, :show, :update]


	def index
		@excercises = Excercise.includes(:main_muscle, :muscles).order(:name)
	end


	def show
	end


	def new
		@excercise = Excercise.new
		@excercise.muscles.build
		render :edit
	end


	def edit
	end


	def create
		@excercise = Excercise.new(filtered_params)
		if @excercise.save
			redirect_to excercises_path, notice: "OK"
		else
			render :edit
		end
	end


	def update
		if @excercise.update(filtered_params)
			redirect_to excercises_path, notice: "OK"
		else
			render :edit
		end
	end


	def destroy
		@excercise.destroy
		redirect_to excercises_path, notice: "OK"
	end


	private


	def set_excercise
		Excercise.find params[:id]
	end


	def filtered_params
		params.require(:excercise)
					.permit(
						:name,
						:default_repetitions_count,
						:default_time,
						:default_weight,
						:main_muscle_id,
						:repetition_based,
						{ muscle_ids: [] }
					)
	end

end
