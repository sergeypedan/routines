class CreateDrugActiveSubstances < ActiveRecord::Migration[5.2]
  def change
    create_table :drug_active_substances do |t|
      t.string :name, null: false
      t.string :daily_dosage, null: false

      t.timestamps
    end
  end
end
