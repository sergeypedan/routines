# frozen_string_literal: true

class Measurement < ApplicationRecord

	# Validations

	validates :lab_id,    presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :marker_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :user_id,   presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :value,     presence: true, numericality: true

	# Associations

	belongs_to :marker, class_name: "HealthMarker"
	belongs_to :lab
	belongs_to :user

	has_one :city, through: :lab

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: measurements
#
#  id        :bigint           not null, primary key
#  value     :float            not null
#  lab_id    :bigint           not null
#  marker_id :bigint
#  user_id   :bigint           not null
#
# Indexes
#
#  index_measurements_on_lab_id     (lab_id)
#  index_measurements_on_marker_id  (marker_id)
#  index_measurements_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (lab_id => labs.id)
#  fk_rails_...  (marker_id => health_markers.id)
#  fk_rails_...  (user_id => users.id)
#
