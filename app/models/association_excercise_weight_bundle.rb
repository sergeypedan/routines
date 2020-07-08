# frozen_string_literal: true

class AssociationExcerciseWeightBundle < ApplicationRecord

  belongs_to :excercise

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: association_excercise_weight_bundles
#
#  id               :bigint           not null, primary key
#  excercise_id     :integer
#  weight_bundle_id :integer
#
# Indexes
#
#  index_association_excercise_weight_bundles_on_excercise_id      (excercise_id)
#  index_association_excercise_weight_bundles_on_weight_bundle_id  (weight_bundle_id)
#
