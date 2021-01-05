# frozen_string_literal: true

class DrugIntake < ApplicationRecord

	# Associations

	belongs_to :drug


	# Validations

	validates :amount, numericality: { greater_than: 0 }
	validates :drug_id, numericality: { only_integer: true, greater_than: 0 }

end

# == Schema Information
# Schema version: 20210105181809
#
# Table name: drug_intakes
#
#  id      :bigint           not null, primary key
#  amount  :float            default(1.0), not null
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
