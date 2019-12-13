# frozen_string_literal: true

class Workout < ApplicationRecord

	# Associations

	belongs_to :excercise


	# Validations

	validates :date, presence: true
	validates :excercise_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
	validates :repetitions_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

end

# == Schema Information
#
# Table name: workouts
#
#  date                :date             not null
#  excercise_id        :integer          not null
#  id                  :bigint           not null, primary key
#  repetitions_count   :integer          default(1), not null
#  resistance_duration :integer
#  weight              :float            default(0.0), not null
#
