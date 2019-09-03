# frozen_string_literal: true

class HealthStateMarkersController < DashboardsController

	def index
		@markers = HealthStateMarker.all
	end

	def new
		@marker = HealthStateMarker.new
		render :edit
	end

	def create
		@marker = HealthStateMarker.new(filtered_params)
		if @marker.save
			redirect_to health_state_markers_path
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
			redirect_to health_state_markers_path
		else
			render :edit
		end
	end

	def destroy
		set_marker
		@marker.destroy
		redirect_to health_state_markers_path
	end


	private

	def filtered_params
		params.require(:health_state_marker)
					.permit(:healthy_value_max,
									:healthy_value_min,
									:healthy_value_source_name,
									:healthy_value_source_url,
									:name_en,
									:name_ru,
									:unit)
	end

	def set_marker
		@marker = HealthStateMarker.find params[:id]
	end

end
