# frozen_string_literal: true

class Mood < ApplicationRecord

	# Validations

	validates :name_en, presence: true, uniqueness: true
	validates :name_ru, presence: true, uniqueness: true

	validates :energy,     numericality: { only_integer: true }, inclusion: { in: 0..100 }
	validates :positivity, numericality: { only_integer: true }, inclusion: { in: 0..100 }

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: moods
#
#  id         :bigint           not null, primary key
#  energy     :integer          default(50)
#  name_en    :string           not null
#  name_ru    :string           not null
#  positivity :integer          default(50)
#
# Indexes
#
#  index_moods_on_name_en  (name_en) UNIQUE
#  index_moods_on_name_ru  (name_ru) UNIQUE
#
