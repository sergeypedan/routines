class RemoveDrugActiveSubstanceIdFromDrugs < ActiveRecord::Migration[6.0]
  def change
    remove_column :drugs, :drug_active_substance_id, :bigint
  end
end
