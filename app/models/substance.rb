# frozen_string_literal: true

class Substance < ApplicationRecord

	# Associations

	has_many :association_drug_substances
	has_many :drugs, through: :association_drug_substances, inverse_of: :substances


	# Validations

	validates :main_function, length: { maximum: 255 }, presence: true
	validates :name,          length: { maximum: 255 }, presence: true
	validates :name_alt,      length: { maximum: 255 }

end

# == Schema Information
# Schema version: 20211215155038
#
# Table name: substances
#
#  id            :bigint           not null, primary key
#  daily_dosage  :string
#  dosage_unit   :string(20)
#  main_function :string           not null
#  name          :string           not null
#  name_alt      :string
#
