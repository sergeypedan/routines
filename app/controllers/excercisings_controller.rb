# frozen_string_literal: true

class ExcercisingsController < ApplicationController

	def index
		@excercisings = Excercising.all
	end


	def new
		@excercising = Excercising.new
		render :edit
	end


	def edit
		@excercising = find_excercising
	end


	def create
		@excercising = Excercising.new(filtered_params)
		if @excercising.save
			redirect_to root_path, notice: "OK"
		else
			render :edit
		end
	end


	def update
		@excercising = find_excercising
		if @excercising.update(filtered_params)
			redirect_to root_path, notice: "OK"
		else
			render :edit
		end
	end


	private


	def find_excercising
		Excercising.find(params[:id])
	end


	def filtered_params
		params.require(:excercising)
					.permit(:date, :excercise_id, :repetitions_count, :resistance_duration)
	end

end
