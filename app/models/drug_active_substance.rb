# frozen_string_literal: true

class DrugActiveSubstance < ApplicationRecord

	has_many :drugs

end

# == Schema Information
#
# Table name: drug_active_substances
#
#  daily_dosage  :string           not null
#  id            :bigint           not null, primary key
#  main_function :string           not null
#  name          :string           not null
#
