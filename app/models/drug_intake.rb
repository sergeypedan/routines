# frozen_string_literal: true

class DrugIntake < ApplicationRecord

	# Associations

	belongs_to :drug


	# Validations

	validates :dosage, presence: true
	validates :drug_id, numericality: { only_integer: true, greater_than: 0 }

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: drug_intakes
#
#  id      :bigint           not null, primary key
#  dosage  :string           not null
#  drug_id :bigint           not null
#
# Indexes
#
#  index_drug_intakes_on_drug_id  (drug_id)
#
# Foreign Keys
#
#  fk_rails_...  (drug_id => drugs.id)
#
