# frozen_string_literal: true

class SettingsController < DashboardsController

	before_action :find_and_assign_setting


	def index
	end


	def edit
	end


	def update
		if @settings.update(filtered_params)
			redirect_to settings_path
		else
			render :edit
		end
	end


	private

	def filtered_params
		params.require(:setting).permit(:time_zone, :language)
	end

	def find_and_assign_setting
		@settings = current_user.setting
	end

end
