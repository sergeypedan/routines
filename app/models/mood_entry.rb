# frozen_string_literal: true

class MoodEntry < ApplicationRecord

	# Associations

  belongs_to :mood
  belongs_to :user

end

# == Schema Information
# Schema version: 20201224111032
#
# Table name: mood_entries
#
#  id      :bigint           not null, primary key
#  comment :text
#  why     :text
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
