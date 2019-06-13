# frozen_string_literal: true

class Setting < ApplicationRecord

	belongs_to :user

end

# == Schema Information
#
# Table name: settings
#
#  id         :bigint           not null, primary key
#  language   :string           default("en"), not null
#  time_zone  :string           default("Moscow"), not null
#  user_id    :bigint           not null
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
