# frozen_string_literal: true

class AssociationWeightBundleWeight < ApplicationRecord

  belongs_to :weight
  belongs_to :weight_bundle

end

# == Schema Information
#
# Table name: association_weight_bundle_weights
#
#  id               :bigint           not null, primary key
#  weight_bundle_id :integer
#  weight_id        :integer
#
