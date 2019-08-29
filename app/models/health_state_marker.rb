# frozen_string_literal: true

class HealthStateMarker < ApplicationRecord

	has_many :measurements

end

# == Schema Information
#
# Table name: health_state_markers
#
#  healthy_value_max         :float            not null
#  healthy_value_min         :float            not null
#  healthy_value_source_name :string
#  healthy_value_source_url  :string
#  id                        :bigint           not null, primary key
#  name_en                   :string           not null
#  name_ru                   :string           not null
#  unit                      :string           not null
#
