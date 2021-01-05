# frozen_string_literal: true

class DrugForm < ApplicationRecord

	validates :name_en, presence: true
	validates :name_ru, presence: true
	validates :unit_en, presence: true
	validates :unit_ru, presence: true

end

# == Schema Information
# Schema version: 20210105175304
#
# Table name: drug_forms
#
#  id      :bigint           not null, primary key
#  name_en :string           not null
#  name_ru :string           not null
#  unit_en :string           default("pc."), not null
#  unit_ru :string           default("шт."), not null
#
