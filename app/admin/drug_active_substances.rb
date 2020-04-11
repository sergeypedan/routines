ActiveAdmin.register DrugActiveSubstance do

  menu parent: "Medicine"

  permit_params :name, :daily_dosage, :main_function, :dosage_unit


  index do
    selectable_column
    id_column

    column :name
    column :daily_dosage do |record|
      [
        record.daily_dosage,
        record.dosage_unit
      ].join(" ") if record.daily_dosage.present?
    end
    column :main_function

    actions
  end

end
