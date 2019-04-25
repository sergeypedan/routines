# frozen_string_literal: true

class AssociationExcerciseMuscle < ApplicationRecord

	belongs_to :excercise
	belongs_to :muscle

end

# == Schema Information
#
# Table name: association_excercise_muscles
#
#  excercise_id :bigint(8)
#  id           :bigint(8)        not null, primary key
#  muscle_id    :bigint(8)
#
# Foreign Keys
#
#  fk_rails_...  (excercise_id => excercises.id)
#  fk_rails_...  (muscle_id => muscles.id)
#
