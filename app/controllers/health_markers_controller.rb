# frozen_string_literal: true

class HealthMarkersController < DashboardsController

	KLASS = HealthMarker

	before_action :set_marker, only: %i[destroy edit update]


	def index
		@markers = KLASS.all
	end


	def new
		@marker = KLASS.new
		render :edit
	end


	def create
		@marker = KLASS.new(filtered_params)
		if @marker.save
			redirect_to health_markers_path
		else
			render :edit
		end
	end


	def edit
	end


	def update
		if @marker.update(filtered_params)
			redirect_to health_markers_path
		else
			render :edit
		end
	end


	def destroy
		@marker.destroy
		redirect_to health_markers_path
	end


	private

	def filtered_params
		params.require(:health_marker)
					.permit(:healthy_value_max,
									:healthy_value_min,
									:healthy_value_source_name,
									:healthy_value_source_url,
									:measurements_group_id,
									:name_en,
									:name_ru,
									:unit)
	end


	def set_marker
		@marker = KLASS.find params[:id]
	end

end
