module YamlDb
	class Importer

		# @dir is directory name
		# @resource like "habits"
		#
		def initialize(resource:, dir: "export")
			@resource = resource
			@dir = dir
		end


		def import!
			puts "\nImporting #{@resource}..."

			if klass.count.positive?
				puts "#{klass} has records. Deleting them."
				klass.destroy_all
			end

			records.each do |record|
				klass.create! record_hash(record)
			end
			puts "#{@resource} imported\n\n"
		end


		private def columns
			yaml["columns"]
		end

		private def file_path
			Rails.root.join("db", @dir, "#{@resource}.yml")
		end

		private def klass
			@klass ||= @resource.singularize.camelize.constantize
		end

		private def record_hash(record)
			fail ArgumentError, "`record` must be an Array" unless record.is_a? Array
			fail StandardError, "`record` length does not match `columns` length" unless record.size == columns.size
			Hash[columns.zip(record)]
		end

		private def records
			@records ||= yaml["records"]
		end

		private def yaml
			@yaml ||= YAML.load_file(file_path)[@resource]
		end

	end
end
