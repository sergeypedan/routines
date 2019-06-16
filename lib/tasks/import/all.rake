# frozen_string_literal: true

namespace :import do
	task environment: :all do

		resources = [
			"muscles",
			"excercises",
			"excercisings",
			"habits",
			"habit_entries",
			"association_excercise_muscles"
		]

		puts "Will import:"
		resources.each do |resource|
			puts "• #{resource}"
		end
		puts

		resources.each do |resource|
			YamlDb::Importer.new(resource: resource).import!
		end

	end
end
