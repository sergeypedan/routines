# frozen_string_literal: true

if Rails.env.development?
  Rails.application.config.after_initialize do
    Bullet.enable       = true
    Bullet.console      = false
    Bullet.rails_logger = true
    Bullet.add_footer   = false
  end
end
