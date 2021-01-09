ActiveAdmin.register Brand do

	menu parent: "Medicine"

	permit_params :name

	config.sort_order = :name

end
