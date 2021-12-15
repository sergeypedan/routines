# frozen_string_literal: true

ActiveAdmin.register Substance do

	menu parent: "Medicine"

	permit_params :name, :name_alt, :daily_dosage, :main_function, :dosage_unit

	config.sort_order = :name

	index do
		selectable_column
		id_column

		column :name
		column :daily_dosage do |record|
			[
				record.daily_dosage,
				record.dosage_unit
			].join(" ") if record.daily_dosage.present?
		end
		column :main_function

		actions
	end


	form do |f|
		f.inputs do
			f.input :name
			f.input :name_alt
			f.input :main_function
			f.input :dosage_unit
			f.input :daily_dosage
		end

		f.actions
	end

end
