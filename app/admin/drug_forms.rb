ActiveAdmin.register DrugForm do

	menu parent: "Medicine"

	permit_params :name_en, :name_ru, :unit_en, :unit_ru

end
