# frozen_string_literal: true

class Meal < ApplicationRecord

	# Associations

  belongs_to :food

end

# == Schema Information
# Schema version: 20230511072143
#
# Table name: meals
#
#  id      :bigint           not null, primary key
#  weight  :integer
#  food_id :bigint           not null
#
# Indexes
#
#  index_meals_on_food_id  (food_id)
#
# Foreign Keys
#
#  fk_rails_...  (food_id => foods.id)
#
