# frozen_string_literal: true

class DrugForm < ApplicationRecord

	validates :name_en, presence: true
	validates :name_ru, presence: true

end

# == Schema Information
#
# Table name: drug_forms
#
#  id         :bigint           not null, primary key
#  name_en    :string           not null
#  name_ru    :string           not null
#
