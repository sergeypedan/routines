# frozen_string_literal: true

ActiveAdmin.register Drug do

	menu parent: "Medicine"

	permit_params :name,
								:brand_id, :drug_form_id,
								association_drug_substances_attributes: [:id, :name, :dose, :substance_id, :unit, :_create, :_destroy, :_update]

	includes :substances, :form, :brand

	config.sort_order = :name_asc


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
				s.input :substance, as: :select, collection: Substance.for_select
				s.input :dose
				s.input :unit
			end
		end

		f.semantic_errors
		f.actions
	end


	show do
		attributes_table(*default_attribute_table_rows)

		panel "substances" do
			table_for(resource.substances.order(:name)) do
				column :name
				column :name_alt
			end
		end
	end

end
