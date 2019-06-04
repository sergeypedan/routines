# frozen_string_literal: true

class AssociationExcerciseMuscle < ApplicationRecord

	belongs_to :excercise
	belongs_to :muscle

end

# == Schema Information
#
# Table name: association_excercise_muscles
#
#  excercise_id :bigint
#  id           :bigint           not null, primary key
#  muscle_id    :bigint
#
# Foreign Keys
#
#  fk_rails_...  (excercise_id => excercises.id)
#  fk_rails_...  (muscle_id => muscles.id)
#
