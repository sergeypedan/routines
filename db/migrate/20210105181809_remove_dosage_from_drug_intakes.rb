class RemoveDosageFromDrugIntakes < ActiveRecord::Migration[6.0]
  def change
    remove_column :drug_intakes, :dosage, :string
  end
end
