ActiveAdmin.register Drug do

	menu parent: "Medicine"

	permit_params :name, :drug_active_substance_id, :drug_form_id, :brand_id

	includes :active_substance, :form, :brand


	index do
		selectable_column
		id_column

		column :name
		column :brand
		column :form
		column :active_substance

		actions
	end


	form do |f|
		f.inputs do
			f.input :name
			f.input :brand
			f.input :drug_form_id, as: :radio, collection: DrugForm.pluck(:name_ru, :id)
			# f.input :drug_active_substance_id

			f.has_many :active_substances, allow_destroy: true do |as|
				as.input :name
			end
		end

		f.semantic_errors
		f.actions
	end

end
