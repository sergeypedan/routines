ActiveAdmin.register DrugIntake do

  menu parent: "Medicine"

  permit_params :drug_id, :dosage

  includes :drug

end
