# frozen_string_literal: true

class DrugActiveSubstance < ApplicationRecord

	# Associations

	has_many :drugs


	# Validations

	validates :daily_dosage,  presence: true
	validates :main_function, presence: true
	validates :name,          presence: true

end

# == Schema Information
#
# Table name: drug_active_substances
#
#  daily_dosage  :string           not null
#  id            :bigint           not null, primary key
#  main_function :string           not null
#  name          :string           not null
#
