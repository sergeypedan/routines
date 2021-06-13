# frozen_string_literal: true

class HealthMarker < ApplicationRecord

	# Associations

	has_many   :measurements
	belongs_to :measurements_group, optional: true
	belongs_to :measurement_object


	# Validations

	validates :healthy_value_max, presence: true, numericality: true
	validates :healthy_value_max, presence: true, numericality: true
	validates :measurements_group_id, numericality: { allow_nil: true, only_integer: true, greater_than_or_equal_to: 1 }
	validates :measurement_object_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates :name_en, presence: true
	validates :name_ru, presence: true
	validates :abbr_en, length: { maximum: 10 }
	validates :abbr_ru, length: { maximum: 10 }

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: health_markers
#
#  id                        :bigint           not null, primary key
#  abbr_en                   :string(10)
#  abbr_ru                   :string(10)
#  healthy_value_max         :float            not null
#  healthy_value_min         :float            not null
#  healthy_value_source_name :string
#  healthy_value_source_url  :string
#  name_en                   :string           not null
#  name_ru                   :string           not null
#  unit                      :string           not null
#  measurement_object_id     :bigint           not null
#  measurements_group_id     :bigint
#
# Indexes
#
#  index_health_markers_on_measurement_object_id  (measurement_object_id)
#  index_health_markers_on_measurements_group_id  (measurements_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (measurement_object_id => measurement_objects.id)
#  fk_rails_...  (measurements_group_id => measurements_groups.id)
#