# frozen_string_literal: true

class DrugActiveSubstance < ApplicationRecord

	# Associations

	has_many :association_drug_substances
	has_many :drugs, through: :association_drug_substances


	# Validations

	validates :main_function, presence: true
	validates :name,          presence: true

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: drug_active_substances
#
#  id            :bigint           not null, primary key
#  daily_dosage  :string
#  dosage_unit   :string(20)
#  main_function :string           not null
#  name          :string           not null
#
