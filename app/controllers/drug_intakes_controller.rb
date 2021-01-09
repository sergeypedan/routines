# frozen_string_literal: true

class DrugIntakesController < DashboardsController

	before_action :assign_resource, only: [:destroy, :duplicate, :edit, :show, :update]


	def index
		@intakes = DrugIntake.includes(drug: [association_drug_substances: :substance]).order(created_at: :desc)
		render :index_mobile if at_mobile?
	end


	def show
	end


	def new
		@intake = DrugIntake.new(created_at: Time.current)
		render :edit
	end


	def create
		@intake = DrugIntake.new(filtered_params)
		if @intake.save
			redirect_to drug_intakes_path
		else
			render :edit
		end
	end


	def edit
	end


	def update
		if @intake.update(filtered_params)
			redirect_to drug_intakes_path
		else
			render :edit
		end
	end


	def destroy
		@intake.destroy
		redirect_to drug_intakes_path
	end


	def duplicate
		DrugIntake.create(@intake.attributes.except("id", "created_at").merge({ created_at: Time.current }))
		redirect_to drug_intakes_path
	end


	private

	def filtered_params
		params
			.require(:drug_intake)
			.permit(:created_at, :dosage, :drug_id)
	end

	def assign_resource
		@intake = DrugIntake.find params[:id]
	end

end
