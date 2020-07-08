# frozen_string_literal: true

class MoodEntry < ApplicationRecord

	# Validations

	validates :mood_id, numericality: { only_integer: true, greater_than: 0 }
	validates :user_id, numericality: { only_integer: true, greater_than: 0 }


	# Associations

  belongs_to :mood
  belongs_to :user

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: mood_entries
#
#  id      :bigint           not null, primary key
#  mood_id :bigint
#  user_id :bigint
#
# Indexes
#
#  index_mood_entries_on_mood_id  (mood_id)
#  index_mood_entries_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (mood_id => moods.id)
#  fk_rails_...  (user_id => users.id)
#
