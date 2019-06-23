# frozen_string_literal: true

class DrugFormsController < DashboardsController

	def index
		@drug_forms = DrugForm.all
	end


	def show
		@drug_form = DrugForm.find params[:id]
	end


	def new
		@drug_form = DrugForm.new
		render :edit
	end


	def create
		@drug_form = DrugForm.new(filtered_params)
		if @drug_form.save
			redirect_to drug_forms_path
		else
			render :edit
		end
	end


	def edit
		@drug_form = DrugForm.find params[:id]
	end


	def update
		@drug_form = DrugForm.find params[:id]
		if @drug_form.update(filtered_params)
			redirect_to drug_forms_path
		else
			render :edit
		end
	end


	def destroy
		DrugForm.find(params[:id]).destroy
	end


	private def filtered_params
		params
			.require(:drug_form)
			.permit(
				:name_en,
				:name_ru
			)
	end

end
