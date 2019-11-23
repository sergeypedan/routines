# frozen_string_literal: true

class DrugIntakesController < DashboardsController

	before_action :assign_resource, only: [:destroy, :duplicate, :edit, :show, :update]


	def index
		@drug_intakes = DrugIntake.includes(:drug).order(created_at: :desc)
	end


	def show
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
	end


	def update
		if @drug_intake.update(filtered_params)
			redirect_to drug_intakes_path
		else
			render :edit
		end
	end


	def destroy
		@drug_intake.destroy
		redirect_to drug_intakes_path
	end


	def duplicate
		DrugIntake.create(@drug_intake.attributes.except("id", "created_at").merge({ created_at: Time.current }))
		redirect_to drug_intakes_path
	end


	private

	def filtered_params
		params
			.require(:drug_intake)
			.permit(:created_at, :dosage, :drug_id)
	end

	def assign_resource
		@drug_intake = DrugIntake.find params[:id]
	end

end
