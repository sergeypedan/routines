ActiveAdmin.register DrugForm do

	menu parent: "Medicine"

	permit_params :name_en, :name_ru

end
