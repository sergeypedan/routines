class CreateAssociationExcerciseWeightBundles < ActiveRecord::Migration[5.2]
  def change
    create_table :association_excercise_weight_bundles do |t|
      t.references :excersise, foreign_key: true
      t.references :weight_bundle, foreign_key: true

      t.timestamps
    end
  end
end
