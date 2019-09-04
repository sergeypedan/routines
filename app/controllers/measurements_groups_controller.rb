# frozen_string_literal: true

class MeasurementsGroupsController < DashboardsController

	KLASS = MeasurementsGroup

	before_action :set_city, only: %i[destroy edit update]


	def index
		@measurements_groups = KLASS.all
	end


	def new
		@measurements_group = KLASS.new
		render :edit
	end


	def create
		@measurements_group = KLASS.new(filtered_params)
		if @measurements_group.save
			redirect_to measurements_groups_path
		else
			render :edit
		end
	end


	def edit
		set_city
	end


	def update
		set_city
		if @measurements_group.update(filtered_params)
			redirect_to measurements_groups_path
		else
			render :edit
		end
	end


	def destroy
		set_city
		@measurements_group.destroy
		redirect_to measurements_groups_path
	end


	private

	def filtered_params
		params.require(:measurements_group).permit(:name_en, :name_ru)
	end

	def set_city
		@measurements_group = KLASS.find params[:id]
	end

end
