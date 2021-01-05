# frozen_string_literal: true

class AssociationDrugSubstance < ApplicationRecord

	# Associations

	belongs_to :drug
	belongs_to :substance


	# Validations

	validates :dose, presence: true
	validates :unit, presence: true

end

# == Schema Information
# Schema version: 20210104181137
#
# Table name: association_drug_substances
#
#  id           :bigint           not null, primary key
#  dose         :decimal(, )      not null
#  unit         :string           default("mg"), not null
#  drug_id      :bigint           not null
#  substance_id :bigint           not null
#
# Indexes
#
#  index_association_drug_substances_on_drug_id       (drug_id)
#  index_association_drug_substances_on_substance_id  (substance_id)
#
# Foreign Keys
#
#  fk_rails_...  (drug_id => drugs.id)
#  fk_rails_...  (substance_id => substances.id)
#
