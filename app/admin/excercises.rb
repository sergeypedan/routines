# frozen_string_literal: true

ActiveAdmin.register Excercise do

	menu parent: "Sport"

	permit_params :angle_max, :default_repetitions_count, :default_time, :default_weight, :flavor_en, :flavor_ru,
								:movement_direction, :movement_type, :name, :name_en, :repetition_based, :simultaneously, :workouts_count,
								:body_position_id, :furniture_id, :grip_id, :main_muscle_id, :synonym_en, :synonym_ru, :weight_type_id,
								muscle_ids: []


	includes :body_position, :furniture, :grip, :main_muscle, :weight_type

	filter :name
	filter :name_en
	filter :main_muscle, collection: -> { Muscle.order(:name) }
	filter :muscles, collection: -> { Muscle.order(:name) }
	filter :movement_type
	filter :movement_direction
	filter :weight_type
	filter :simultaneously, as: :boolean
	filter :repetition_based, as: :boolean
	filter :body_position
	filter :grip
	filter :furniture


	index do
		selectable_column
		id_column

		column :name_en
		column :movement_type
		column :movement_direction
		column :flavor_en
		column :body_position
		column :weight_type
		column :furniture
		column :grip
		column :simultaneously
		column :main_muscle
		column :workouts_count

		actions
	end


	form do |f|
		f.inputs do
			f.input :name_en
			f.input :name
			f.input :synonym_en
			f.input :synonym_ru
		end

		f.inputs do
			f.input :movement_type, as: :radio, collection: Excercise::MOVEMENT_TYPES
			f.input :movement_direction, as: :radio, collection: Excercise::MOVEMENT_DIRECTIONS
			f.input :body_position
			f.input :weight_type
			f.input :furniture
			f.input :grip
			f.input :simultaneously
			f.input :angle_max

			f.input :flavor_en
			f.input :flavor_ru
		end

		f.inputs do
			f.input :default_repetitions_count
			f.input :default_time
			f.input :default_weight, input_html: { step: 0.25 }
		end

		f.inputs do
			f.input :main_muscle
			f.input :muscles
		end

		f.inputs do
			f.input :workouts_count, input_html: { readonly: true, disabled: true }
		end

		f.actions
	end


	show do
		attributes_table(*default_attribute_table_rows)

		panel "Etc" do
			table do
				thead do
					tr do
						th "Param"
						th "Value"
					end
				end

				tbody do
					tr do
						td "name_with_flavor"
						td resource.name_with_flavor
					end
					tr do
						td "name_components"
						td resource.name_components.inspect
					end
				end

				# column :id
				# column :name do |rec| link_to exercise_name_combined(rec), admin_excercise_path(rec), target: :_blank end
			end
		end
	end

end
