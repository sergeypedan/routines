# frozen_string_literal: true

class City < ApplicationRecord

	has_many :labs

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: cities
#
#  id      :bigint           not null, primary key
#  name_en :string           not null
#  name_ru :string           not null
#
