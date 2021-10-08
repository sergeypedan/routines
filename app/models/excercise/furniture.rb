# frozen_string_literal: true

class Excercise::Furniture < ApplicationRecord

	# Validations

	validates :name_en, length: { maximum: 255 }, presence: true, uniqueness: true
	validates :name_ru, length: { maximum: 255 }, presence: true, uniqueness: true


	# Associations

	has_many :excercises


	# Class methods

	def self.table_name_prefix
		"excercise_"
	end


	# Methods

	def display_name
		name_en
	end

end

# == Schema Information
# Schema version: 20211002161717
#
# Table name: excercise_furnitures
#
#  id      :bigint           not null, primary key
#  name_en :string           not null
#  name_ru :string           not null
#
# Indexes
#
#  index_excercise_furnitures_on_name_en  (name_en) UNIQUE
#  index_excercise_furnitures_on_name_ru  (name_ru) UNIQUE
#