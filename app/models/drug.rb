# frozen_string_literal: true

class Drug < ApplicationRecord

	# Validations

	validates :drug_active_substance_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :drug_form_id,             presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :name, presence: true


	# Associations

	belongs_to :active_substance,
							class_name: "DrugActiveSubstance",
							foreign_key: "drug_active_substance_id"

	belongs_to :brand, optional: true

	belongs_to :form,
							class_name: "DrugForm",
							foreign_key: "drug_form_id"

	has_many :drug_intakes, dependent: :destroy

  has_many :association_drug_substances
  has_many :active_substances, through: :association_drug_substances

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: drugs
#
#  id                       :bigint           not null, primary key
#  name                     :string           not null
#  brand_id                 :bigint
#  drug_active_substance_id :bigint
#  drug_form_id             :bigint           not null
#
# Indexes
#
#  index_drugs_on_brand_id                  (brand_id)
#  index_drugs_on_drug_active_substance_id  (drug_active_substance_id)
#  index_drugs_on_drug_form_id              (drug_form_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#  fk_rails_...  (drug_active_substance_id => drug_active_substances.id)
#  fk_rails_...  (drug_form_id => drug_forms.id)
#
