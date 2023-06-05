# frozen_string_literal: true

ActiveAdmin.register Meal do

	menu parent: "Food"

	permit_params :food_id, :weight

	form do |f|
		f.inputs do
			f.input :food
			f.input :weight
			f.input :created_at, as: :date_time_picker
		end

		actions
	end
  
end
