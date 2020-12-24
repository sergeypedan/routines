# frozen_string_literal: true

class Brand < ApplicationRecord

	# Validations

	validates :name, presence: true


	# Associations

	has_many :drugs

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: brands
#
#  id   :bigint           not null, primary key
#  name :string           not null
#
