# frozen_string_literal: true

class Lab < ApplicationRecord

	belongs_to :city

	has_many :measurements, dependent: :restrict_with_error

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: labs
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  street_address :string
#  city_id        :bigint           not null
#
# Indexes
#
#  index_labs_on_city_id  (city_id)
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id)
#
