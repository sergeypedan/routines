# frozen_string_literal: true

class MeasurementObject < ApplicationRecord

	has_many :health_markers

end

# == Schema Information
#
# Table name: measurement_objects
#
#  id         :bigint           not null, primary key
#  name_en    :string           not null
#  name_ru    :string           not null
#
