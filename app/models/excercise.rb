# frozen_string_literal: true

class Excercise < ApplicationRecord

	# Associaitons

	has_many   :excercises, dependent: :destroy
	has_many   :association_excercise_muscles, dependent: :destroy
	belongs_to :main_muscle, class_name: "Muscle", foreign_key: "main_muscle_id"
	has_many   :muscles, through: :association_excercise_muscles
	has_many   :workouts, dependent: :destroy


	# Validations

	validates :default_repetitions_count, numericality: { only_integer: true, greater_than: 0 }
	validates :default_weight, numericality: { greater_than_or_equal_to: 0 }
	validates :name,    presence: true
	validates :name_en, presence: true


	# Methods

	def flavor(locale)
		public_send "flavor_#{locale}"
	end

	def l_name(locale)
		name
		# public_send "name_#{locale}"
	end

	def repetition_based?
		default_time.zero?
	end

end

# == Schema Information
# Schema version: 20210212062248
#
# Table name: excercises
#
#  id                        :bigint           not null, primary key
#  default_repetitions_count :integer          default(15), not null
#  default_time              :integer          default(60), not null
#  default_weight            :float            default(0.0), not null
#  flavor_en                 :string
#  flavor_ru                 :string
#  name                      :string           not null
#  name_en                   :string
#  repetition_based          :boolean          default(TRUE)
#  main_muscle_id            :bigint           not null
#
# Indexes
#
#  index_excercises_on_main_muscle_id  (main_muscle_id)
#
# Foreign Keys
#
#  fk_rails_...  (main_muscle_id => muscles.id)
#
