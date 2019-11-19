class CreateDrugIntakes < ActiveRecord::Migration[5.2]
  def change
    create_table :drug_intakes do |t|
      t.references :drug, foreign_key: true, null: false
      t.string :dosage, null: false

      t.timestamps
    end
  end
end
