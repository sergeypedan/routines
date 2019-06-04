# frozen_string_literal: true

class HabitEntry < ApplicationRecord

	# Validations

	validates :habit_id, presence: true, numericality: { only_integer: true, greater_than: 0 }


	# Associations

	belongs_to :habit


  # Methods

  delegate :time_unit, to: :habit

  def duration
    @duration ||= Duration.new(time, time_unit)
  end

end

# == Schema Information
#
# Table name: habit_entries
#
#  habit_id   :bigint
#  id         :bigint           not null, primary key
#  time       :integer          default(0), not null
#
# Foreign Keys
#
#  fk_rails_...  (habit_id => habits.id)
#
