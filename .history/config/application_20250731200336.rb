require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Logix
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

-     # Settings in config/environments/* take precedence over those specified here.
+     # Please, add to the `ignore` list any other `lib` subdirectories that do
-     # Application configuration should go into files in config/initializers
+     # not contain `.rb` files, or that should not be reloaded or eager loaded.
-     # -- all .rb files in that directory are automatically loaded.
+     # Common ones are `templates`, `generators`, or `middleware`, for example.
+     config.autoload_lib(ignore: %w[assets tasks])

-     # configuring mailer previews directory
+     # Configuration for the application, engines, and railties goes here.
-     config.action_mailer.preview_path = "#{Rails.root}/lib/mailer_previews"
+     #
-
+     # These settings can be overridden in specific environments using the files
-     # config/application.rb
+     # in config/environments, which are processed later.
-
+     #
-     config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
+     # config.time_zone = "Central Time (US & Canada)"
-     config.i18n.available_locales = [:ar, :bn, :de, :en, :es, :fr, :hi, :ja, :ml, :mr, :ne]
+     # config.eager_load_paths << Rails.root.join("extras")
-     config.i18n.default_locale = :en
-     config.i18n.fallbacks = true
-
-     # configuring middleware
-     config.middleware.use Rack::Attack
-
-     # configuring forum
-     overrides = "#{Rails.root}/app/overrides"
-     Rails.autoloaders.main.ignore(overrides)
-
-     config.to_prepare do
-       Dir.glob("#{overrides}/**/*_override.rb").each do |override|
-         load override
-       end
-     end
-
-     # Site config
-     config.site_url = "https://circuitverse.org/"
-     config.site_name = "CircuitVerse"
-     config.site_category = "Digital Logic Circuits"
-     config.site_download_url = "https://circuitverse.org/simulator"
-     config.site_image = "https://circuitverse.org/img/circuitverse2.svg"
-     config.site_description = "Explore Digital circuits online with CircuitVerse. With our easy to use simulator interface, you will be building circuits in no time."
-     config.slack_url = "https://circuitverse.org/slack"
  end
end
