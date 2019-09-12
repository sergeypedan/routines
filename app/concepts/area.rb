# frozen_string_literal: true

class Area

	AREAS = YAML.load_file(Rails.root.join("db", "yaml_db", "areas.yml"))

	def initialize(hash)
		@hash = hash.deep_symbolize_keys
	end

	def self.all
		AREAS.map { |hash| self.new(hash) }
	end

	[:dashboard_action,
		:controllers,
		:name_en,
		:name_ru,
		:path
	].each do |mname|
		define_method(mname) do @hash[mname] end
	end

	# AREAS.each do |area_hash|
	# 	mname = area_hash["path"].to_sym
	# 	define_method(mname) do @hash[mname] end
	# end

end
