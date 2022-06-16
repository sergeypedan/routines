# frozen_string_literal: true

class Workout < ApplicationRecord

	# Associations

	belongs_to :excercise, counter_cache: true


	# Validations

	validates :date, presence: true
	validates :excercise_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates :repetitions_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates :resistance_duration, numericality: { greater_than: 0 }, allow_nil: true
	validates :weight, presence: true, numericality: { greater_than_or_equal_to: 0 }

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: workouts
#
#  id                  :bigint           not null, primary key
#  date                :date             not null
#  repetitions_count   :integer          default(1), not null
#  resistance_duration :integer
#  weight              :float            default(0.0), not null
#  excercise_id        :integer          not null
#
# Indexes
#
#  index_workouts_on_excercise_id  (excercise_id)
#
