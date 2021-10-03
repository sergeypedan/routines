# frozen_string_literal: true

class Excercise < ApplicationRecord

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

	validates :default_repetitions_count, numericality: { only_integer: true, greater_than: 0 }
	validates :default_time,   numericality: { greater_than_or_equal_to: 0 }
	validates :default_weight, numericality: { greater_than_or_equal_to: 0 }
	validates :name,    presence: true
	validates :name_en, presence: true

	validate do
		if (default_repetitions_count > 1) && default_time.positive?
			errors.add :default_repetitions_count, "cannot be > 1 if default_time is > 0"
			errors.add :default_time,              "cannot be > 0 if default_repetitions_count is > 1"
		end

		if (default_repetitions_count == 1) && default_time.zero?
			errors.add :default_repetitions_count, "cannot be 1 if default_time is 0"
			errors.add :default_time,              "cannot be 0 if default_repetitions_count is 1"
		end
	end


	# Methods

	def display_name
		name_with_flavor(:en)
	end

	def name_with_flavor(locale = :en)
		[
			l_name(locale),
			weight_type&.public_send("name_#{locale}")&.downcase,
			flavor(locale)&.downcase,
			grip&.public_send("name_#{locale}")&.downcase,
			body_position&.public_send("name_#{locale}")&.downcase,
			furniture&.public_send("name_#{locale}")&.downcase,
		].select(&:present?).join(", ")
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
# Schema version: 20211003151042
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
