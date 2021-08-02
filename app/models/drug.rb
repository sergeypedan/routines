# frozen_string_literal: true

class Drug < ApplicationRecord

	# Validations

	validates :name, presence: true


	# Scopes

	scope :for_select, -> { select(:brand_id, :name, :id).order(:name).includes(:brand) }


	# Associations

	belongs_to :brand, optional: true

	belongs_to :form, class_name: "DrugForm", foreign_key: "drug_form_id"

	has_many :drug_intakes, dependent: :destroy

	has_many :association_drug_substances
	accepts_nested_attributes_for :association_drug_substances

	has_many :substances, through: :association_drug_substances, inverse_of: :drugs
	accepts_nested_attributes_for :substances


	# Methods

	def name_with_brand
		brand_id ? "#{name} (#{brand.name})" : name
	end

end

# == Schema Information
# Schema version: 20210104181650
#
# Table name: drugs
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  brand_id     :bigint
#  drug_form_id :bigint           not null
#
# Indexes
#
#  index_drugs_on_brand_id      (brand_id)
#  index_drugs_on_drug_form_id  (drug_form_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (drug_form_id => drug_forms.id)
#
