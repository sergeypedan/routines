# frozen_string_literal: true

ActiveAdmin.register Excercise do

	menu parent: "Sport"

	permit_params :angle_max, :default_repetitions_count, :default_time, :default_weight, :flavor_en, :flavor_ru, :name,
								:name_en, :repetition_based, :simultaneously, :workouts_count,
								:body_position_id, :furniture_id, :grip_id, :main_muscle_id, :weight_type_id,
								muscle_ids: []


	includes :body_position, :furniture, :grip, :main_muscle, :weight_type

	index do
		selectable_column
		id_column

		column :name_en
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
		end

		f.inputs do
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
			f.input :default_weight
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

end
