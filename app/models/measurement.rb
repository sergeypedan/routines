# frozen_string_literal: true

class Measurement < ApplicationRecord

	# Validations

	validates :lab_id,    presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :marker_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :user_id,   presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :value,     presence: true, numericality: true

	# Associations

	belongs_to :marker, class_name: "HealthStateMarker"
	belongs_to :lab
	belongs_to :user

	has_one :city, through: :lab

end

# == Schema Information
#
# Table name: measurements
#
#  id         :bigint           not null, primary key
#  lab_id     :bigint           not null
#  marker_id  :bigint
#  user_id    :bigint           not null
#  value      :float            not null
#
# Foreign Keys
#
#  fk_rails_...  (lab_id => labs.id)
#  fk_rails_...  (marker_id => health_state_markers.id)
#  fk_rails_...  (user_id => users.id)
#
