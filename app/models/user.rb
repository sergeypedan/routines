# frozen_string_literal: true

class User < ApplicationRecord


	# Callbacks

	after_initialize :set_placeholder_valudes, if: :new_record?
	# after_create :create_associate_settings


	# Associations

	has_one  :habits,        dependent: :destroy
	has_one  :habit_entries, dependent: :destroy
	has_many :measurements,  dependent: :destroy
	has_many :mood_entries,  dependent: :destroy
	has_one  :setting,       dependent: :destroy


	# Macros

	# Include default devise modules. Others available are: :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable,
					:lockable,
					:recoverable,
					:registerable,
					:rememberable,
					:validatable

	# Methods

	def full_name
		[first_name, last_name].join(" ")
	end


	# private def create_associate_settings
	# 	self.create_setting
	# end


	private def set_placeholder_valudes
		self.first_name ||= "John"
		self.last_name  ||= "Doe"
		# self.uid        ||= SecureRandom.hex(7)
	end

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string           not null
#  last_name              :string           not null
#  locked_at              :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unlock_token           :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
