class AddAmountToDrugIntakes < ActiveRecord::Migration[6.0]
  def change
    add_column :drug_intakes, :amount, :float, default: 1.0, null: false
  end
end
