# frozen_string_literal: true

class Lab < ApplicationRecord

	belongs_to :city

	has_many :measurements, dependent: :restrict_with_error

end

# == Schema Information
#
# Table name: labs
#
#  city_id        :bigint           not null
#  id             :bigint           not null, primary key
#  name           :string           not null
#  street_address :string
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#
