ActiveAdmin.register Drug do

	menu parent: "Medicine"

	permit_params :brand_id, :drug_form_id, :name,
								association_drug_substances_attributes: [:id, :name, :dose, :substance_id, :unit, :_create, :_destroy, :_update]

	includes :substances, :form, :brand

	config.sort_order = :name


	filter :name
	filter :brand
	filter :substances


	index do
		selectable_column
		id_column

		column :name
		column :brand
		column :form
		column :substances

		actions
	end


	form do |f|
		f.inputs do
			f.input :name
			f.input :brand
			f.input :drug_form_id, as: :radio, collection: DrugForm.pluck(:name_ru, :id)

			f.has_many :association_drug_substances, allow_destroy: true, new_record: true do |s|
				s.input :substance
				s.input :dose
				s.input :unit
			end
		end

		f.semantic_errors
		f.actions
	end

end
