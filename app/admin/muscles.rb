# frozen_string_literal: true

ActiveAdmin.register Muscle do

	menu parent: "Sport"

	permit_params :name, :name_en


	show do
		attributes_table(*default_attribute_table_rows)

		panel "Excercises" do
			table_for(resource.excercises) do
				column :id
				column :name do |rec| link_to exercise_name_combined(rec), admin_excercise_path(rec), target: :_blank end
			end
		end
	end

end
