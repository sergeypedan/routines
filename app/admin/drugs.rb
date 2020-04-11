ActiveAdmin.register Drug do

  menu parent: "Medicine"

  permit_params :name, :drug_active_substance_id, :drug_form_id

  includes :active_substance, :form


  index do
    selectable_column
    id_column

    column :name
    column :form
    column :active_substance

    actions
  end


  form do |f|
    f.inputs do
      f.input :name
      f.input :drug_form_id, as: :radio, collection: DrugForm.pluck(:name_ru, :id)
      f.input :drug_active_substance_id
    end

    f.semantic_errors
    f.actions
  end

end
