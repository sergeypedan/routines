# frozen_string_literal: true

module ExerciseHelper

	def exercise_name_combined(ex)
		fail unless ex.is_a?(Excercise)

		[
			ex.l_name(locale),
			("up to #{ex.angle_max}°" if ex.angle_max),
			ex.flavor(locale),
				ex.weight_type&.public_send("name_#{locale}"),
			t(ex.simultaneously ? "simultaneously" : "separately"),
							 ex.grip&.public_send("name_#{locale}"),
			ex.body_position&.public_send("name_#{locale}"),
					ex.furniture&.public_send("name_#{locale}"),
		].select(&:present?)
		.map.with_index { |str, index| index.zero? ? str : str.downcase }
		.join(", ")
	end

end
