class RemoveTimestampsFromActiveSubstances < ActiveRecord::Migration[6.0]
  def change
    %i[
      association_excercise_muscles
      association_excercise_weight_bundles
      association_weight_bundle_weights
      cities
      drug_active_substances
      drug_forms
      drug_substances
      drugs
      excercises
      habits
      health_markers
      labs
      measurement_objects
      measurements_groups
      moods
      muscles
      settings
      weight_bundles
      weights
    ].each do |table_sym|
      remove_column table_sym, :created_at
      remove_column table_sym, :updated_at
    end
  end
end
