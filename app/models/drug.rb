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

	belongs_to :form,
							class_name: "DrugForm",
							foreign_key: "drug_form_id"

	has_many :drug_intakes, dependent: :destroy

end

# == Schema Information
#
# Table name: drugs
#
#  drug_active_substance_id :bigint
#  drug_form_id             :bigint           not null
#  form                     :string           default("tablet"), not null
#  id                       :bigint           not null, primary key
#  name                     :string           not null
#
# Foreign Keys
#
#  fk_rails_...  (drug_active_substance_id => drug_active_substances.id)
#  fk_rails_...  (drug_form_id => drug_forms.id)
#
