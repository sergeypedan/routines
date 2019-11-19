# frozen_string_literal: true

class DrugIntake < ApplicationRecord

	# Associations

	belongs_to :drug


	# Validations

	validates :dosage, presence: true
	validates :drug_id, numericality: { only_integer: true, greater_than: 0 }

end

# == Schema Information
#
# Table name: drug_intakes
#
#  dosage     :string           not null
#  drug_id    :bigint           not null
#  id         :bigint           not null, primary key
#
# Foreign Keys
#
#  fk_rails_...  (drug_id => drugs.id)
#
