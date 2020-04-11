class RemoveUpdatedAtFromDrugIntakes < ActiveRecord::Migration[6.0]
  def change
    remove_column :drug_intakes, :updated_at
  end
end
