# frozen_string_literal: true

module ValidationHelper

	include FnValidations

	def validators_for(record:, attr:, type: nil, options: [])
		fail TypeError, "record must implement validations" unless record.class.ancestors.include?(ActiveModel::Validations)
		validate_argument_type! options, Array
		klass = ["ActiveRecord::Validations::", type.capitalize, "Validator"].join.constantize if type.present?
		result = record.class.validators
		result = result.select { _1.attributes.include? attr }
		result = result.select { _1.is_a? klass } if type.present?
		result = result.select { _1.options.keys & options }
		result
	end

	def validator_names(record:, attr:)
		validators_for(record: record, attr: attr).map(&:class).map(&:name).map { |v| v.gsub("ActiveRecord::Validations::", "").gsub("ActiveModel::Validations::", "").gsub("Validator", "") }
	end

	def validated_value(record:, attr:, type: nil, options: [])
		fail TypeError, "`options` must be an Arrya, you pass a #{options.class}" unless options.is_a? Array
		validators_for(record: record, attr: attr, type: type, options: options).map { first_value(_1, options) }.compact.first
	end

	def first_value(validator, options)
		options.map { |key| validator.options&.fetch(key, nil) }.compact.first
	end

	def validated_maxlengh(record, attr)
		validated_value(record: record, attr: attr, type: :length, options: [:maximum])
	end

	def validated_minlengh(record, attr)
		validated_value(record: record, attr: attr, type: :length, options: [:minimum])
	end

	def validated_presence(record, attr)
		# validated_value(record: record, attr: attr, type: :presence, options: [:presece]) ?
		validators_for(record: record, attr: attr, type: :presence).any?
	end

	def validated_numeric_max(record, attr)
		validated_value(record: record, attr: attr, type: :numericality, options: [:less_than, :less_than_or_equal_to])
	end

	def validated_numeric_min(record, attr)
		validated_value(record: record, attr: attr, type: :numericality, options: [:greater_than, :greater_than_or_equal_to])
	end

end
