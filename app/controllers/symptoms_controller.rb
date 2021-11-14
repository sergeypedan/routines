# frozen_string_literal: true

class SymptomsController < DashboardsController

	def index
		@symptoms = Symptom.all
	end


	def show
		@symptom = Symptom.find params[:id]
	end


	def new
		@symptom = Symptom.new
		render :edit
	end


	def create
		@symptom = Symptom.new(filtered_params)
		render :edit and return unless @symptom.save
		redirect_to symptoms_path
	end


	def edit
		@symptom = Symptom.find params[:id]
	end


	def update
		@symptom = Symptom.find params[:id]
		render :edit and return unless @symptom.update(filtered_params)
		redirect_to symptoms_path
	end


	def destroy
		Symptom.find(params[:id]).destroy
	end


	private def filtered_params
		params.require(:symptom).permit(:created_at, :description, :duration_value, :duration_unit, :title)
	end

end
