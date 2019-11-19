# frozen_string_literal: true

class DrugIntakesController < DashboardsController

	def index
		@drug_intakes = DrugIntake.includes(:drug).order(:created_at)
	end


	def show
		@drug_intake = DrugIntake.find params[:id]
	end


	def new
		@drug_intake = DrugIntake.new
		render :edit
	end


	def create
		@drug_intake = DrugIntake.new(filtered_params)
		if @drug_intake.save
			redirect_to drug_intakes_path
		else
			render :edit
		end
	end


	def edit
		@drug_intake = DrugIntake.find params[:id]
	end


	def update
		@drug_intake = DrugIntake.find params[:id]
		if @drug_intake.update(filtered_params)
			redirect_to drug_intakes_path
		else
			render :edit
		end
	end


	def destroy
		DrugIntake.find(params[:id]).destroy
	end


	private def filtered_params
		params
			.require(:drug_intake)
			.permit(:created_at, :dosage, :drug_id)
	end

end
