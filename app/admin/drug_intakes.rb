ActiveAdmin.register DrugIntake do

	menu parent: "Medicine"

	permit_params :drug_id, :dosage, :created_at

	includes :drug

	config.sort_order :created_at_asc


	form do |f|
		f.inputs do
			f.input :drug, as: :select, collection: Drug.pluck(:name, :id)
			f.input :dosage
			f.input :created_at, as: :date_time_picker
		end

		f.semantic_errors
		f.actions
	end

end
