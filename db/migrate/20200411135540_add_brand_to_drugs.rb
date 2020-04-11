class AddBrandToDrugs < ActiveRecord::Migration[6.0]
  def change
    add_reference :drugs, :brand, foreign_key: true
  end
end
