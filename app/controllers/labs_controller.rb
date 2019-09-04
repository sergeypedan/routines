# frozen_string_literal: true

class LabsController < DashboardsController

	before_action :set_lab, only: %i[destroy edit update]

	KLASS = Lab


	def index
		@labs = KLASS.includes(:city)
	end


	def new
		@lab = KLASS.new
		render :edit
	end


	def create
		@lab = KLASS.new(filtered_params)
		if @lab.save
			redirect_to labs_path
		else
			render :edit
		end
	end


	def edit
	end


	def update
		if @lab.update(filtered_params)
			redirect_to labs_path
		else
			render :edit
		end
	end


	def destroy
		@lab.destroy
		redirect_to labs_path
	end


	private

	def filtered_params
		params.require(:lab).permit(:city_id, :id, :name, :street_address)
	end


	def set_lab
		@lab = KLASS.find params[:id]
	end

end
