# frozen_string_literal: true

class Muscle < ApplicationRecord

	# Validations

	validates :name,    length: { maximum: 255 }, presence: true, uniqueness: true
	validates :name_en, length: { maximum: 255 }


	# Associations

	has_many :association_excercise_muscles
	has_many :excercises, through: :association_excercise_muscles

	has_many :targeted_excercises, class_name: "Excercise", foreign_key: "main_muscle_id"


	# Scopes

	scope :for_select, -> { select(:name_en, :id).order(:name_en) }


	# Methods

	def l_name(locale = :en)
		locale.to_s == "ru" ? name : (public_send("name_#{locale}").presence || name)
	end

	def display_name
		name_en
	end

end

# == Schema Information
# Schema version: 20210620205328
#
# Table name: muscles
#
#  id      :bigint           not null, primary key
#  name    :string           not null
#  name_en :string
#
# Indexes
#
#  index_muscles_on_name  (name) UNIQUE
#
