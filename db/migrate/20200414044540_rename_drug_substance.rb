class RenameDrugSubstance < ActiveRecord::Migration[6.0]
  def change
    rename_table :drug_substances, :association_drug_substances
  end
end
