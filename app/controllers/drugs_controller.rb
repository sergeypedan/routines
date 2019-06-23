# frozen_string_literal: true

class DrugsController < DashboardsController

	def index
		@drugs = Drug.includes(:active_substance).all
	end


	def show
		@drug = Drug.find params[:id]
	end


	def new
		@drug = Drug.new
		render :edit
	end


	def create
		@drug = Drug.new(filtered_params)
		if @drug.save
			redirect_to drugs_path
		else
			render :edit
		end
	end


	def edit
		@drug = Drug.find params[:id]
	end


	def update
		@drug = Drug.find params[:id]
		if @drug.update(filtered_params)
			redirect_to drugs_path
		else
			render :edit
		end
	end


	def destroy
		Drug.find(params[:id]).destroy
	end


	private def filtered_params
		params
			.require(:drug)
			.permit(
				:drug_active_substance_id,
				     :active_substance_id,

				:drug_form_id,
				     :form_id,

				:name
			)
	end

end
