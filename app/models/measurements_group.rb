# frozen_string_literal: true

class MeasurementsGroup < ApplicationRecord

	# Validations

	validates :name_en, presence: true
	validates :name_ru, presence: true


	# Associaitons

	has_many :health_markers
	has_many :measurements, through: :health_markers

end

# == Schema Information
#
# Table name: measurements_groups
#
#  id         :bigint           not null, primary key
#  name_en    :string           not null
#  name_ru    :string           not null
#
