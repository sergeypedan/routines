# frozen_string_literal: true

module NavbarHelper

	def super_navbar_a_classes(area)
		fail ArgumentError, "an Area must be passed" unless area.is_a? Area
		["super-navbar__area__a", (:active if is_active_area?(area))]
	end

	def is_active_area?(area)
		return true if area.controllers.include? controller_name
		return true if area.path == action_name && controller_name == "dashboards"
		return false
	end

	def current_area
		Area.all.find { |area| is_active_area?(area) }
	end

end
