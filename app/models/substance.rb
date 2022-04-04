# frozen_string_literal: true

class Substance < ApplicationRecord

	# Validations

	validates :daily_dosage,  length: { maximum: 20  }
	validates :dosage_unit,   length: { maximum: 255 }
	validates :main_function, length: { maximum: 255 }, presence: true
	validates :name,          length: { maximum: 255 }, presence: true, uniqueness: true
	validates :name_alt,      length: { maximum: 255 }


	# Associations

	has_many :association_drug_substances
	has_many :drugs, through: :association_drug_substances, inverse_of: :substances


	# Scope

	scope :for_select, -> { select("CASE WHEN LENGTH(substances.name_alt) > 0 THEN CONCAT(substances.name, ' (', substances.name_alt, ')') ELSE substances.name END AS name", :id) }

end

# == Schema Information
# Schema version: 20220404233640
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
# Indexes
#
#  index_substances_on_name  (name) UNIQUE
#
