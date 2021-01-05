class RenameDrugActiveSubstancesToSubstances < ActiveRecord::Migration[6.0]
  def change
    rename_table :drug_active_substances, :substances
  end
end
