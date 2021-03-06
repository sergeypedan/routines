require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Routines
	class Application < Rails::Application
		config.load_defaults 5.2

		config.i18n.default_locale = :en # не ru_RU
		# config.i18n.default_locale = :ru # не ru_RU
		# config.time_zone = "Moscow"
		config.time_zone = "UTC"
		config.active_record.default_timezone = :utc

		# API: http://edgeguides.rubyonrails.org/configuring.html#configuring-generators
		# Разъяснение http://rusrails.ru/configuring-rails-applications
		config.generators do |g|
			g.assets false
			g.channel assets: false
			g.controller_specs false
			g.factory_bot true
			g.fixture_replacement :factory_bot, dir: "spec/factories"
			g.helper false
			g.helper_specs false
			g.stylesheets false
			g.system_tests false
			g.view_specs false
			g.test_framework :rspec,
												controller_specs: false,
												fixtures: false,
												helper_specs: false,
												request_specs: false,
												routing_specs: false,
												view_specs: false
		end

		config.paths.add "concepts", eager_load: true
		config.paths.add "lib",      eager_load: true
	end
end
