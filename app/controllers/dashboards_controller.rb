# frozen_string_literal: true

class DashboardsController < ApplicationController

	before_action :authenticate_user!
	before_action :set_user_time_zone
	before_action :set_user_language


	private def set_user_time_zone
		Time.zone = ActiveSupport::TimeZone.new(current_user.setting.time_zone)
	end

	private def set_user_language
		I18n.locale = current_user.setting.language
	end

end
