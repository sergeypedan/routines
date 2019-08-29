# frozen_string_literal: true

class Measurement < ApplicationRecord

	belongs_to :health_state_marker
	belongs_to :lab
	belongs_to :user

end

# == Schema Information
#
# Table name: measurements
#
#  id         :bigint           not null, primary key
#  lab_id     :bigint           not null
#  user_id    :bigint           not null
#  value      :float            not null
#
# Foreign Keys
#
#  fk_rails_...  (lab_id => labs.id)
#  fk_rails_...  (user_id => users.id)
#
