source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "autoprefixer-rails"
gem "activerecord-sortable"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap"
gem "coffee-rails"
gem "devise"
gem "font-awesome-rails"
gem "jbuilder"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "integral-corrector", github: "sergeypedan/integral-corrector"
gem "pg", ">= 0.18", "< 2.0" # must appear before [puma, rails, russian]
gem "puma"
gem "rails", "~> 5"
gem "sass-rails"
gem "slim-rails"
gem "uglifier"
gem "webpacker"
gem "yaml_db"

group :development, :test do
  gem "bullet"
  gem "byebug", platform: :mri
  gem "meta_request"
  gem "pry-rails"
  gem "pry-byebug"
  gem "records_count"
end

group :development do
	gem "annotate"
  gem "web-console"
  gem "listen", ">= 3.0.5", "< 3.2"
end

group :test do
  gem "factory_bot_rails" # must be also in dev for generators
  gem "faker" # must be also in dev for generators
  gem "rspec-rails"
end
