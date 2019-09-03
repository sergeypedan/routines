# frozen_string_literal: true

class LabsController < DashboardsController

	def index
		@labs = Lab.includes(:city)
	end

	def new
		@lab = Lab.new
		render :edit
	end

	def create
		@lab = Lab.new(filtered_params)
		if @lab.save
			redirect_to labs_path
		else
			render :edit
		end
	end

	def edit
		set_lab
	end

	def update
		set_lab
		if @lab.update(filtered_params)
			redirect_to labs_path
		else
			render :edit
		end
	end

	def destroy
		set_lab
		@lab.destroy
		redirect_to labs_path
	end


	private

	def filtered_params
		params.require(:lab).permit(:city_id, :id, :name, :street_address)
	end

	def set_lab
		@lab = Lab.find params[:id]
	end

end
