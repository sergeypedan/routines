# frozen_string_literal: true

ActiveAdmin.register Excercise do

	menu parent: "Sport"

	permit_params :default_repetitions_count, :default_time, :default_weight, :flavor_en, :flavor_ru, :name, :name_en, :repetition_based,
								:body_position_id, :furniture_id, :main_muscle_id, :weight_type_id,
								muscle_ids: []


	includes :body_position, :furniture, :main_muscle, :weight_type

	index do
		selectable_column
		id_column

		column :name_en
		column :flavor_en
		column :body_position
		column :weight_type
		column :furniture

		column :main_muscle

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

		f.actions
	end

end
