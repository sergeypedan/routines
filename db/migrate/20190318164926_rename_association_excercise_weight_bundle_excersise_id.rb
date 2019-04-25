class RenameAssociationExcerciseWeightBundleExcersiseId < ActiveRecord::Migration[5.2]
  def change
  	rename_column :association_excercise_weight_bundles, :excersise_id, :excercise_id
  end
end
