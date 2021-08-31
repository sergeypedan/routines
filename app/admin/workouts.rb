# frozen_string_literal: true

ActiveAdmin.register Workout do

	menu parent: "Sport"

	permit_params :date, :excercise_id, :repetitions_count, :resistance_duration, :weight

	includes :excercise

	index do
		selectable_column
		id_column

		column :date
		column :excercise
		column :repetitions_count
		column :resistance_duration
		column :weight

		actions
	end


	form do |f|
		f.inputs do
			f.input :date
			f.input :excercise
		end

		f.inputs do
			f.input :repetitions_count
			f.input :resistance_duration
			f.input :weight
		end

		f.actions
	end

end
