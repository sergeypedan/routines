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
		column :repetitions_count
		column :resistance_duration
		column :weight

		actions
	end

end
