class AddSubstanceIdToDrugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :drugs, :drug_active_substance, foreign_key: true
  end
end
