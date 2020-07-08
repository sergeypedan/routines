# frozen_string_literal: true

class Setting < ApplicationRecord

	LANGUAGES = { en: "English", ru: "Русский" }.freeze


	# Associations

	belongs_to :user


	# Validations

	validates :language, presence: true, inclusion: { in: LANGUAGES.keys.map(&:to_s) }
	validates :user_id,  presence: true, numericality: { only_integer: true, greater_than: 0 }


	# Methods

	def language_to_s
		LANGUAGES[self.language.to_sym]
	end

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: settings
#
#  id        :bigint           not null, primary key
#  language  :string           default("en"), not null
#  time_zone :string           default("Moscow"), not null
#  user_id   :bigint           not null
#
# Indexes
#
#  index_settings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
