# frozen_string_literal: true

class Area

	AREAS = YAML.load_file(Rails.root.join("db", "yaml_db", "areas.yml")).freeze

	def initialize(hash)
		@hash = hash.deep_symbolize_keys
	end

	# hash looks like so:
	#   controllers: [excercises workouts muscles]
	#   dashboard_action: workout
	#   name_en: Sport
	#   name_ru: Спорт
	#   path: workouts
	#
	def self.all
		AREAS.map { |hash| self.new(hash) }
	end

	[:dashboard_action,
		:controllers,
		:name_en,
		:name_ru,
		:path
	].each do |m_name|
		define_method(m_name) do @hash[m_name] end
	end

	# AREAS.each do |area_hash|
	# 	m_name = area_hash["path"].to_sym
	# 	define_method(m_name) do @hash[m_name] end
	# end

end
