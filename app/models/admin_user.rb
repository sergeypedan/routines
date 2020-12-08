# frozen_string_literal: true

class AdminUser < ApplicationRecord

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :rememberable, :validatable

end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: admin_users
#
#  id                 :bigint           not null, primary key
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#
# Indexes
#
#  index_admin_users_on_email  (email) UNIQUE
#
