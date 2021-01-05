class AddUnitToDrugForm < ActiveRecord::Migration[6.0]
  def change
    add_column :drug_forms, :unit_en, :string, default: "pc.", null: false
    add_column :drug_forms, :unit_ru, :string, default: "шт.", null: false
  end
end
