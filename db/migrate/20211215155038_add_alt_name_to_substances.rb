class AddAltNameToSubstances < ActiveRecord::Migration[6.1]
  def change
    add_column :substances, :name_alt, :string
  end
end
