# frozen_string_literal: true

class HealthMarkersController < DashboardsController

	def index
		@markers = HealthMarker.all
	end

	def new
		@marker = HealthMarker.new
		render :edit
	end

	def create
		@marker = HealthMarker.new(filtered_params)
		if @marker.save
			redirect_to health_markers_path
		else
			render :edit
		end
	end

	def edit
		set_marker
	end

	def update
		set_marker
		if @marker.update(filtered_params)
			redirect_to health_markers_path
		else
			render :edit
		end
	end

	def destroy
		set_marker
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
									:name_en,
									:name_ru,
									:unit)
	end

	def set_marker
		@marker = HealthMarker.find params[:id]
	end

end
