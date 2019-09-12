# frozen_string_literal: true

class ExcercisingsController < DashboardsController

	def index
		@excercisings = Excercising.includes(excercise: :muscles).order(:date)
	end


	def new
		@excercising = Excercising.new(date: Date.today)
		render :edit
	end


	def edit
		@excercising = find_excercising
	end


	def create
		@excercising = Excercising.new(filtered_params)
		if @excercising.save
			redirect_to excercisings_path, notice: "OK"
		else
			render :edit
		end
	end


	def update
		@excercising = find_excercising
		if @excercising.update(filtered_params)
			redirect_to excercisings_path, notice: "OK"
		else
			render :edit
		end
	end


	private


	def find_excercising
		Excercising.find(params[:id])
	end


	def filtered_params
		params
			.require(:excercising)
			.permit(
				:date,
				:excercise_id,
				:repetitions_count,
				:resistance_duration
			)
	end

end
