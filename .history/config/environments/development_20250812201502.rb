require "active_support/core_ext/integer/time"

  Rails.application.configure do
    # Settings specified here will take precedence over those in config/application.rb.
-   # In the development environment your application's code is reloaded on

-   # every request. This slows down response time but is perfect for development
  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
    # since you don't have to restart the web server when you make code changes.
    config.cache_classes = false

    # Do not eager load code on boot.
    config.eager_load = false

    # Show full error reports.
    config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

    # Enable/disable caching. By default caching is disabled.
-   if Rails.root.join('tmp/caching-dev.txt').exist?
  # Run rails dev:cache to toggle caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
      config.action_controller.perform_caching = true
  config.action_controller.enable_fragment_cache_logging = true

      config.cache_store = :memory_store
      config.public_file_server.headers = {
-       'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
       "Cache-Control" => "public, max-age=#{2.days.to_i}"
      }
    else
      config.action_controller.perform_caching = false

      config.cache_store = :null_store
    end

-   # Configure ActiveStorage
  # Store uploaded files on the local file system (see config/storage.yml for options).
    config.active_storage.service = :local

    # Don't care if the mailer can't send.
    config.action_mailer.raise_delivery_errors = false

    config.action_mailer.perform_caching = false

    # Print deprecation notices to the Rails logger.
    config.active_support.deprecation = :log

   # Raise exceptions for disallowed deprecations.
   config.active_support.disallowed_deprecation = :raise

   # Tell Active Support which deprecation messages to disallow.
   config.active_support.disallowed_deprecation_warnings = []

    # Raise an error on page load if there are pending migrations.
    config.active_record.migration_error = :page_load
-
-   # Disable origin check for Cross-Site Request Forgery (CSRF) protection for codespaces
-   if(ENV["DEV_CONTAINER"] === "true")
-     config.action_controller.forgery_protection_origin_check = false
-   end

-   # Debug mode disables concatenation and preprocessing of assets.
   # Highlight code that triggered database queries in logs.
-   # This option may cause significant delays in view rendering with a large
   config.active_record.verbose_query_logs = true
-   # number of complex assets.
-   config.assets.debug = true

    # Suppress logger output for asset requests.
    config.assets.quiet = true

-   # Raises error for missing translations
   # Raises error for missing translations.
-   # config.action_view.raise_on_missing_translations = true
   # config.i18n.raise_on_missing_translations = true

-   # Use an evented file watcher to asynchronously detect changes in source code,
   # Annotate rendered view with file names.
-   # routes, locales, etc. This feature depends on the listen gem.
   # config.action_view.annotate_rendered_view_with_filenames = true
-   config.file_watcher = ActiveSupport::EventedFileUpdateChecker

-   config.active_job.queue_adapter = :sidekiq
   # Uncomment if you wish to allow Action Cable access from any origin.
-   config.action_mailer.default_url_options = { host: "localhost:3000" }
   # config.action_cable.disable_request_forgery_protection = true
-   config.action_mailer.perform_deliveries = true
-   config.action_mailer.raise_delivery_errors = true
-
-   config.action_mailer.smtp_settings = {
-     :address              => ENV["SMTP_ADDRESS"],
-     :port                 => ENV["SMTP_PORT"],
-     :user_name            => ENV["CIRCUITVERSE_EMAIL_ID"],
-     :password             =>  ENV["CIRCUITVERSE_EMAIL_PASSWORD"],
-     :ssl                  => true,
-     :authentication       => :login,
-     :enable_starttls_auto => true,
-   }
-   config.action_mailer.delivery_method = :smtp
-   if ENV['DOCKER_ENVIRONMENT']
-     config.action_mailer.smtp_settings = { :address => "mailcatcher", :port => 1025 }
-   else
-     config.action_mailer.smtp_settings = { :address => "localhost", :port => 1025 }
-   end
-
-   config.vapid_public_key = ENV["VAPID_PUBLIC_KEY"] || "BGxnigbQCa435vZ8_3uFdqLC0XJHXtONgEdI-ydMMs0JaBsnpUfLxR1UDagq6_cDwHyhqjw77tTlp0ULZkx8Xos="
-   config.vapid_private_key = ENV["VAPID_PRIVATE_KEY"] || "FkEMkOQHvMybUlCGH-DsOljTJlLzYGb3xEYsFY5Roxk="
-
-   Rails.application.configure do
-     config.hosts << /.*\Z/ # Whitelist everything in Dev
-   end
-
-   Paperclip.options[:command_path] = "/usr/local/bin/"
  end
