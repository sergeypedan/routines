# frozen_string_literal: true

ActiveAdmin.register Excercise::BodyPosition do

	menu parent: "Sport"

	permit_params :name_en, :name_ru

	includes :excercise

end
