class RemoveFormFromDrugs < ActiveRecord::Migration[6.0]
  def change
    remove_column :drugs, :form
  end
end
