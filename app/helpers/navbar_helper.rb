# frozen_string_literal: true

module NavbarHelper

	def super_navbar_a_classes(area)
		fail ArgumentError, "an Area must be passed" unless area.is_a? Area
		["super-navbar__area__a", (:active if is_active_area?(area))]
	end

	def is_active_area?(area)
		return true if area.controllers.any? do |ctr_act|
																			controller, action = ctr_act.split("#")
																			controller == controller_name && action == action_name
																		end
		return true if controller_name == "areas" && area.dashboard_action == action_name
		return false
	end

	def current_area
		@ca ||= Area.all.find { |area| is_active_area?(area) }
		fail "No `current_area` for #{controller_name}##{action_name}" unless @ca
		@ca
	end

end
