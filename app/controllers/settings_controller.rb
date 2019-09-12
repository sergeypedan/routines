# frozen_string_literal: true

class SettingsController < DashboardsController

	before_action :assign_setting, only: [:index, :edit, :update]


	def index
	end


	def edit
	end


	def update
		if @setting.update(filtered_params)
			redirect_to settings_path
		else
			render :edit
		end
	end


	private

	def filtered_params
		params.require(:setting).permit(:time_zone, :language)
	end

	def assign_setting
		@setting = current_user.setting
	end

end
