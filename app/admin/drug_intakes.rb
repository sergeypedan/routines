ActiveAdmin.register DrugIntake do

	menu parent: "Medicine"

	permit_params :amount, :created_at, :drug_id

	includes :drug

	config.sort_order = :created_at_desc

	filter :drug, collection: -> { Drug.select(:name, :id).order(:name) }


	index do
		selectable_column
		id_column

		column :drug
		column :amount do |rec|
			[
				rec.amount,
				rec.drug.form.public_send("unit_#{I18n.locale}")
			].join(" ")
		end
		column :created_at

		actions
	end


	form do |f|
		f.inputs do
			f.input :drug, as: :select, collection: Drug.pluck(:name, :id)
			f.input :amount, hint: f.object.drug.form.public_send("unit_#{I18n.locale}")
			f.input :created_at, as: :date_time_picker
		end

		f.semantic_errors
		f.actions
	end

end
