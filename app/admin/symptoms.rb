# frozen_string_literal: true

ActiveAdmin.register Symptom do

	menu parent: "Medicine"

	permit_params :created_at, :title, :description, :duration, :duration_unit

end
