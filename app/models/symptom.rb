# frozen_string_literal: true

class Symptom < ApplicationRecord

	DURATION_UNITS = %w[millisecond second minute hour day week month year].freeze


	# Validations

	validates :description,    length: { maximum: 65_500 }
	validates :duration_value, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
	validates :duration_unit,  inclusion: { in: DURATION_UNITS }, presence: true
	validates :title,          length: { maximum: 255 }

end

# == Schema Information
# Schema version: 20211114160101
#
# Table name: symptoms
#
#  id             :bigint           not null, primary key
#  description    :text
#  duration_unit  :string           not null
#  duration_value :integer
#  title          :string           not null
#
