class AddFormToDrugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :drugs, :drug_form, foreign_key: true, null: false
  end
end
