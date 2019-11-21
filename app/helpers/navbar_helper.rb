# frozen_string_literal: true

module NavbarHelper

	def super_navbar_a_classes(area)
		fail ArgumentError, "an Area must be passed" unless area.is_a? Area
		["super-navbar__area__a", (:active if is_active_area?(area))]
	end

	def is_active_area?(area)
		return true if area.controllers.any? { |ctrlr_name| ctrlr_name == controller_name }
		return true if controller_name == "areas" && area.dashboard_action == action_name
		return false
	end

	def current_area
		@ca ||= Area.all.find { |area| is_active_area?(area) }
		fail "No `current_area` for #{controller_name}##{action_name}" unless @ca
		@ca
	end

	def navbar_pages(area_name)
		case area_name
		when "Habits"
			[
				{ name:             t("activerecord.models.day_habit"), href: day_habits_path },
				{ name:           t("activerecord.models.habit_stats"), href: habit_stats_path },
				{ name:          HabitEntry.model_name.human(count: :many), href: habit_entries_path },
				{ name:               Habit.model_name.human(count: :many), href: habits_path }
			]
		when "Medicine"
			[
				{ name:          DrugIntake.model_name.human(count: :many), href: drug_intakes_path },
				{ name:                Drug.model_name.human(count: :many), href: drugs_path },
        { name:            DrugForm.model_name.human(count: :many), href: drug_forms_path },
				{ name: DrugActiveSubstance.model_name.human(count: :many), href: drug_active_substances_path },
				{ name:                 Lab.model_name.human(count: :many), href: labs_path },
				{ name:         Measurement.model_name.human(count: :many), href: measurements_path },
				{ name:   MeasurementsGroup.model_name.human(count: :many), href: measurements_groups_path },
				{ name:        HealthMarker.model_name.human(count: :many), href: health_markers_path }
			]
		when "Spirit"
			[
				{ name:           MoodEntry.model_name.human(count: :many), href: mood_entries_path },
				{ name:                Mood.model_name.human(count: :many), href: moods_path }
			]
		when "Workout"
			[
				{ name:         Excercising.model_name.human(count: :many), href: excercisings_path },
				{ name:           Excercise.model_name.human(count: :many), href: excercises_path },
				{ name:              Muscle.model_name.human(count: :many), href: muscles_path },
				{ name:              Weight.model_name.human(count: :many), href: root_path },
				{ name:        WeightBundle.model_name.human(count: :many), href: root_path }
			]
		when "Settings"
			[
				{ name:                City.model_name.human(count: :many), href: cities_path },
				{ name:             Setting.model_name.human(count: :many), href: settings_path }
			]
		else []
		end
	end

end
