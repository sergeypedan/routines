# frozen_string_literal: true

class Excercise < ApplicationRecord

	MOVEMENT_TYPES = [
		"crunch torso",
		"curl",
		"push",
		"punch",
		"kick",
		"squat",
		"pull",
		"raise",
	].freeze

	MOVEMENT_DIRECTIONS = [
		"afront 45°",
		"afront",
		"down",
		"to the back",
		"to the sides",
		"up"
	].freeze

	# Associaitons

	has_many   :association_excercise_muscles, dependent: :destroy
	belongs_to :body_position, optional: true
	belongs_to :furniture, optional: true
	belongs_to :grip, optional: true
	belongs_to :main_muscle, class_name: "Muscle", foreign_key: "main_muscle_id"
	has_many   :muscles, through: :association_excercise_muscles
	belongs_to :weight_type, optional: true
	has_many   :workouts, dependent: :destroy

	accepts_nested_attributes_for :muscles


	# Validations

	validates :angle_max, allow_nil: true, numericality: { only_integer: true }, angle: true
	validates :default_repetitions_count, numericality: { only_integer: true, greater_than: 0 }
	validates :default_time,   numericality: { greater_than_or_equal_to: 0, only_integer: true }
	validates :default_weight, numericality: { greater_than_or_equal_to: 0 }
	validates :movement_type, length: { maximum: 255 }
	validates :synonym_en, length: { maximum: 255 }
	validates :synonym_ru, length: { maximum: 255 }
	validates :name,    presence: true
	validates :name_en, presence: true
	validates :workouts_count, counter: true

	validate do
		if (default_repetitions_count > 1) && default_time.to_i.positive?
			errors.add :default_repetitions_count, "cannot be > 1 if default_time is > 0"
			errors.add :default_time,              "cannot be > 0 if default_repetitions_count is > 1"
		end

		if (default_repetitions_count == 1) && default_time.to_i.zero?
			errors.add :default_repetitions_count, "cannot be 1 if default_time is 0"
			errors.add :default_time,              "cannot be 0 if default_repetitions_count is 1"
		end
	end


	# Methods

	def display_name
		name_with_flavor(:en)
	end

	def name_with_flavor(locale = :en)
		components = name_components(locale)
		components = components.values.select(&:present?)
		components[0] = components.first.titleize
		components.join(" ")
	end

	def name_components(locale = :en)
		{
			synonym:            l_synonym(locale).presence&.then { "“#{_1}”" },
			name:               l_name(locale).to_s.tr("_", "").presence,
			movement_type:      movement_type.presence,
			weight_type:        weight_type&.public_send("name_#{locale}")&.downcase,
			movement_direction: movement_direction,
			angle_max:         ("upto #{angle_max}°" if angle_max),
			flavor:             flavor(locale)&.downcase,
			simultaneously:     l_simultaneously(locale),
			grip:               grip&.public_send("name_#{locale}")&.downcase,
			body_position:      body_position&.public_send("name_#{locale}")&.downcase,
			furniture:          furniture&.public_send("name_#{locale}")&.downcase,
		}
	end

	def l_simultaneously(locale = :en)
		case simultaneously
		when true  then locale.to_sym == :en ? "simultaneously" : "одновременно"
		when false then locale.to_sym == :en ? "separately" : "порознь"
		else nil
		end
	end

	def l_synonym(locale = :en)
		public_send "synonym_#{locale}"
	end

	def flavor(locale)
		public_send "flavor_#{locale}"
	end

	def l_name(locale)
		locale.to_s == "ru" ? name : (public_send("name_#{locale}").presence || name)
	end

	def repetition_based?
		default_time.zero? && (default_repetitions_count > 1)
	end

end

# == Schema Information
# Schema version: 20230408025931
#
# Table name: excercises
#
#  id                        :bigint           not null, primary key
#  angle_max                 :integer
#  default_repetitions_count :integer          default(15), not null
#  default_time              :integer          default(60), not null
#  default_weight            :float            default(0.0), not null
#  flavor_en                 :string
#  flavor_ru                 :string
#  movement_direction        :string
#  movement_type             :string
#  name                      :string           not null
#  name_en                   :string
#  repetition_based          :boolean          default(TRUE)
#  simultaneously            :boolean
#  synonym_en                :string
#  synonym_ru                :string
#  workouts_count            :integer          default(0), not null
#  body_position_id          :bigint
#  furniture_id              :bigint
#  grip_id                   :bigint
#  main_muscle_id            :bigint           not null
#  weight_type_id            :bigint
#
# Indexes
#
#  index_excercises_on_body_position_id  (body_position_id)
#  index_excercises_on_furniture_id      (furniture_id)
#  index_excercises_on_grip_id           (grip_id)
#  index_excercises_on_main_muscle_id    (main_muscle_id)
#  index_excercises_on_weight_type_id    (weight_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (body_position_id => excercise_body_positions.id)
#  fk_rails_...  (furniture_id => excercise_furnitures.id)
#  fk_rails_...  (grip_id => excercise_grips.id)
#  fk_rails_...  (main_muscle_id => muscles.id)
#  fk_rails_...  (weight_type_id => excercise_weight_types.id)
#
