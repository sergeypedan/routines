# frozen_string_literal: true

class Excercise < ApplicationRecord

	# Associaitons

	has_many :excercisings, dependent: :destroy

	has_many :association_excercise_muscles, dependent: :destroy
	has_many :muscles, through: :association_excercise_muscles


	# Validations

	validates :default_repetitions_count, numericality: { only_integer: true, greater_than: 0 }
	validates :name, presence: true


	# Methods

	def repetition_based?
		default_time.zero?
	end

end

# == Schema Information
#
# Table name: excercises
#
#  default_repetitions_count :integer          default(15), not null
#  default_time              :integer          default(60), not null
#  id                        :bigint           not null, primary key
#  name                      :string           not null
#  repetition_based          :boolean          default(TRUE)
#
