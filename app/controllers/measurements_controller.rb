# frozen_string_literal: true

class MeasurementsController < DashboardsController

	def index
		@measurements = Measurement.order(created_at: :desc)
	end

	def new
		@measurement = Measurement.new(created_at: Time.current)
		render :edit
	end

	def create
		@measurement = Measurement.new(filtered_params.merge(user_id: current_user.id))
		if @measurement.save
			redirect_to measurements_path
		else
			render :edit
		end
	end

	def edit
		set_measurement
	end

	def update
		set_measurement
		if @measurement.update(filtered_params)
			redirect_to measurements_path
		else
			render :edit
		end
	end

	def destroy
		set_measurement
		@measurement.destroy
		redirect_to measurements_path
	end


	private

	def filtered_params
		params.require(:measurement).permit(:created_at, :lab_id, :value, :marker_id)
	end

	def set_measurement
		@measurement = Measurement.find params[:id]
	end

end
