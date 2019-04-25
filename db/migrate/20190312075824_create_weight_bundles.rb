class CreateWeightBundles < ActiveRecord::Migration[5.2]
  def change
    create_table :weight_bundles do |t|
      t.string :name, null: false
      t.decimal :weight, null: false

      t.timestamps
    end
  end
end
