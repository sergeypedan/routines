# frozen_string_literal: true

class Weight < ApplicationRecord
end

# == Schema Information
# Schema version: 20200414044540
#
# Table name: weights
#
#  id   :bigint           not null, primary key
#  mass :decimal(, )      default(5000.0), not null
#  type :string           default("Блин"), not null
#
