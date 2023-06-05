# frozen_string_literal: true

ActiveAdmin.register Food do

	menu parent: "Food"

	permit_params :name_en, :name_ru, :kcal_in_100_g, :protein_in_100_g, :carbs_in_100_g, :fats_in_100_g

end
