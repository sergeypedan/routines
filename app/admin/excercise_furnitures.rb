# frozen_string_literal: true

ActiveAdmin.register Excercise::Furniture do

	menu parent: "Sport"

	permit_params :name_en, :name_ru

	includes :excercises

end
