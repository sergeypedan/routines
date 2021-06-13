# frozen_string_literal: true

ActiveAdmin.register Muscle do

	menu parent: "Sport"

	permit_params :name, :name_en

end
