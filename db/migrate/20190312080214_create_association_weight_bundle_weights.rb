class CreateAssociationWeightBundleWeights < ActiveRecord::Migration[5.2]
  def change
    create_table :association_weight_bundle_weights do |t|
      t.references :weight, foreign_key: true
      t.references :weight_bundle, foreign_key: true

      t.timestamps
    end
  end
end
