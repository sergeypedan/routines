# frozen_string_literal: true

class Duration

	ALLOWED_UNITS = [:hours, :minutes, :seconds].freeze

	def initialize(amount, unit)
		@amount = amount
		@unit = unit.to_sym # Accepting strings as well
		fail ArgumentError, "`unit` must be one of: #{ALLOWED_UNITS.map { |un| ":#{un}" }.join(", ")} — you passed #{unit.inspect}" unless ALLOWED_UNITS.include? @unit
		fail ArgumentError, "`amount` must be a Numeric, you passed '#{amount}' (#{amount.class})" unless amount.is_a? Numeric
	end

  delegate :>, :>=, :<, :<=, to: :asd

  def asd
    @asd ||= ActiveSupport::Duration.build(seconds)
  end

	def to_s
		"#{@amount} #{@unit}"
	end

	def minutes
		@minutes ||= seconds / 60.to_f
	end

	def seconds
		@seconds ||= begin
		               case @unit
		               when :seconds then @amount
		               when :minutes then @amount * 60
		               when :hours   then @amount * 60 * 60
		               end
		             end
	end

	def hours
		@hours ||= minutes / 60.to_f
	end

	# Accepting strings as well
	def in(unit)
		unit = unit.to_sym
		fail ArgumentError, "`unit` must be one of: #{ALLOWED_UNITS.map { |un| ":#{un}" }.join(", ")} — you passed #{unit.inspect}" unless ALLOWED_UNITS.include? unit
		self.public_send unit
	end

	def in_s(unit, to_i: true)
		number = to_i ? self.in(unit).to_i : self.in(unit)
		[number, unit.to_s].join(" ")
	end

end
