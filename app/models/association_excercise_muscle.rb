# frozen_string_literal: true

class AssociationExcerciseMuscle < ApplicationRecord

	belongs_to :excercise
	belongs_to :muscle

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: association_excercise_muscles
#
#  id           :bigint           not null, primary key
#  excercise_id :bigint
#  muscle_id    :bigint
#
# Indexes
#
#  index_association_excercise_muscles_on_excercise_id  (excercise_id)
#  index_association_excercise_muscles_on_muscle_id     (muscle_id)
#
# Foreign Keys
#
#  fk_rails_...  (excercise_id => excercises.id)
#  fk_rails_...  (muscle_id => muscles.id)
#
