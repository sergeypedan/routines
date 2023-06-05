# frozen_string_literal: true

class Food < ApplicationRecord

	# Associations

	validates :carbs_in_100_g,   numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :fats_in_100_g,    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :kcal_in_100_g,    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :protein_in_100_g, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	validates :name_en, presence: true, length: { maximum: 255 }, uniqueness: true
	validates :name_ru, presence: true, length: { maximum: 255 }, uniqueness: true


  # Methods

  def display_name
  	name_en
  end

end

# == Schema Information
# Schema version: 20230511063628
#
# Table name: foods
#
#  id               :bigint           not null, primary key
#  carbs_in_100_g   :decimal(, )
#  fats_in_100_g    :decimal(, )
#  kcal_in_100_g    :integer
#  name_en          :string
#  name_ru          :string
#  protein_in_100_g :decimal(, )
#
# Indexes
#
#  index_foods_on_name_en  (name_en) UNIQUE
#  index_foods_on_name_ru  (name_ru) UNIQUE
#
