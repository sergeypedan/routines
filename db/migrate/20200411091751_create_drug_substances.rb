class CreateDrugSubstances < ActiveRecord::Migration[6.0]
  def change
    create_table :drug_substances do |t|
      t.references :drug, null: false, foreign_key: true
      t.references :substance, null: false, foreign_key: { to_table: :drug_active_substances }
      t.decimal :dose, null: false
      t.string :unit, null: false, default: "mg"

      t.timestamps
    end
  end
end
