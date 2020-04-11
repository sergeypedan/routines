class RemoveNotNullCstrFromActiveSubstanceDose < ActiveRecord::Migration[6.0]
  def change
    change_column_null :drug_active_substances, :daily_dosage, true
    add_column :drug_active_substances, :dosage_unit, :string, limit: 20
  end
end
