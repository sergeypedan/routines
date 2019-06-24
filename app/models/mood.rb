# frozen_string_literal: true

class Mood < ApplicationRecord

	# Validations

	validates :name_en, presence: true, uniqueness: true
	validates :name_ru, presence: true, uniqueness: true

	validates :energy,     numericality: { only_integer: true }, inclusion: { in: 0..100 }
	validates :positivity, numericality: { only_integer: true }, inclusion: { in: 0..100 }

end

# == Schema Information
#
# Table name: moods
#
#  energy     :integer          default(50)
#  id         :bigint           not null, primary key
#  name_en    :string           not null
#  name_ru    :string           not null
#  positivity :integer          default(50)
#
