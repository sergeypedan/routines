# frozen_string_literal: true

class HealthMarker < ApplicationRecord

	# Associations

	has_many :measurements


	# Validations

	validates :healthy_value_max, presence: true, numericality: true
	validates :healthy_value_max, presence: true, numericality: true
	validates :name_en, presence: true
	validates :name_ru, presence: true

end

# == Schema Information
#
# Table name: health_markers
#
#  healthy_value_max         :float            not null
#  healthy_value_min         :float            not null
#  healthy_value_source_name :string
#  healthy_value_source_url  :string
#  id                        :bigint           not null, primary key
#  name_en                   :string           not null
#  name_ru                   :string           not null
#  unit                      :string           not null
#
