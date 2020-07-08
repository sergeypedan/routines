# frozen_string_literal: true

class AssociationWeightBundleWeight < ApplicationRecord

  belongs_to :weight
  belongs_to :weight_bundle

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: association_weight_bundle_weights
#
#  id               :bigint           not null, primary key
#  weight_bundle_id :integer
#  weight_id        :integer
#
# Indexes
#
#  index_association_weight_bundle_weights_on_weight_bundle_id  (weight_bundle_id)
#  index_association_weight_bundle_weights_on_weight_id         (weight_id)
#
