# frozen_string_literal: true

class Brand < ApplicationRecord

	# Validations

	validates :name, presence: true, uniqueness: true


	# Associations

	has_many :drugs

end

# == Schema Information
# Schema version: 20210801173336
#
# Table name: brands
#
#  id   :bigint           not null, primary key
#  name :string           not null
#
# Indexes
#
#  index_brands_on_name  (name) UNIQUE
#
