# frozen_string_literal: true

class AssociationExcerciseWeightBundle < ApplicationRecord

  belongs_to :excercise

end

# == Schema Information
#
# Table name: association_excercise_weight_bundles
#
#  excercise_id     :integer
#  id               :bigint           not null, primary key
#  weight_bundle_id :integer
#
