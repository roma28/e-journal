require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module EJournal
  class Application < Rails::Application

    config.active_record.raise_in_transactional_callbacks = true
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
    config.i18n.default_locale = :ru
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.exceptions_app = self.routes
  end
end
