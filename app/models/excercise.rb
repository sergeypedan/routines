# frozen_string_literal: true

class Excercise < ApplicationRecord

	# Associaitons

	has_many   :association_excercise_muscles, dependent: :destroy
	belongs_to :main_muscle, class_name: "Muscle", foreign_key: "main_muscle_id"
	has_many   :muscles, through: :association_excercise_muscles
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

	def active_admin_name
		name_with_flavor(:en)
	end

	def name_with_flavor(locale = :en)
		[
			l_name(locale),
			flavor(locale)
		].select(&:present?).join(" ")
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
