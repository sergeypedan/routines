# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController

	def create
		super
		Setting.create!(user_id: resource.id)
	end

end
