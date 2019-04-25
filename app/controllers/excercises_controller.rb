# frozen_string_literal: true

class ExcercisesController < ApplicationController

	def index
		@excercises = Excercise.all
	end


	def new
		@excercise = Excercise.new
		@excercise.muscles.build
		render :edit
	end


	def edit
		@excercise = find_excercise
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
		@excercise = find_excercise
		if @excercise.update(filtered_params)
			redirect_to excercises_path, notice: "OK"
		else
			render :edit
		end
	end


	private


	def find_excercise
		Excercise.find params[:id]
	end


	def filtered_params
		params.require(:excercise)
					.permit(
						:name,
						:default_repetitions_count,
						:default_time,
						:repetition_based,
						{ muscle_ids: [] }
					)
	end

end
