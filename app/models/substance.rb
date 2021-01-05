# frozen_string_literal: true

class Substance < ApplicationRecord

	# Associations

	has_many :association_drug_substances
	has_many :drugs, through: :association_drug_substances, inverse_of: :substances


	# Validations

	validates :main_function, presence: true
	validates :name,          presence: true

end

# == Schema Information
# Schema version: 20210104181137
#
# Table name: substances
#
#  id            :bigint           not null, primary key
#  daily_dosage  :string
#  dosage_unit   :string(20)
#  main_function :string           not null
#  name          :string           not null
#
