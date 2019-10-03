# frozen_string_literal: true

class Muscle < ApplicationRecord

	# Validations

	validates :name, presence: true


	# Associations

	has_many :association_excercise_muscles
	has_many :excercises, through: :association_excercise_muscles

	has_many :targeted_excercises, class_name: "Excercise", foreign_key: "main_muscle_id"

end

# == Schema Information
#
# Table name: muscles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#
