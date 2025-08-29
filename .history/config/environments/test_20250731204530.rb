require "simplecov"
require "simplecov-lcov"
SimpleCov::Formatter::LcovFormatter.config.report_with_single_file = true
SimpleCov.formatter = SimpleCov::Formatter::LcovFormatter
SimpleCov.start do
  add_filter(/^\/spec\//) # For RSpec, use `test` for MiniTest
  enable_coverage(:branch)
end

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = false

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = true

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.seconds.to_i}"
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  # Configure Active Storage
  config.active_storage.service = :test

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test
  config.active_job.queue_adapter = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Disable Rack::Attack in test env to not throttle tests
  config.middleware.delete Rack::Attack

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  config.vapid_public_key = "BP0eSFqHWrs8xtF96UegaSl5rZJDbPkRen_9oQPZfq9q6iFmbwuELSKqm89qydRcG_F5xSsavxvbGyh_ci9_SQM="
  config.vapid_private_key = "uGNkt259yGQDgGQYP1R4r3q1vTKkCddZe3rImyZvM4w="

  config.action_mailer.default_url_options = { host: "example.com" }
  config.assets.css_compressor = nil
end




require "active_support/core_ext/integer/time"


+ # The test environment is used exclusively to run your application's
+ # test suite. You never need to work with it otherwise. Remember that
+ # your test database is "scratch space" for the test suite and is wiped
+ # and recreated between test runs. Don't rely on the data there!
+
  Rails.application.configure do
    # Settings specified here will take precedence over those in config/application.rb.

-   # The test environment is used exclusively to run your application's
+   # While tests run files are not watched, reloading is not necessary.
-   # test suite. You never need to work with it otherwise. Remember that
+   config.enable_reloading = false
-   # your test database is "scratch space" for the test suite and is wiped
-   # and recreated between test runs. Don't rely on the data there!
-   config.cache_classes = false

-   # Do not eager load code on boot. This avoids loading your whole application
+   # Eager loading loads your entire application. When running a single test locally,
-   # just for the purpose of running a single test. If you are using a tool that
+   # this is usually not necessary, and can slow down your test suite. However, it's
-   # preloads Rails for running tests, you may have to set it to true.
+   # recommended that you enable it in continuous integration systems to ensure eager
-   config.eager_load = true
+   # loading is working properly before deploying your code.
+   config.eager_load = ENV["CI"].present?

    # Configure public file server for tests with Cache-Control for performance.
-   config.public_file_server.enabled = true
+   config.public_file_server.headers = { "Cache-Control" => "public, max-age=#{1.hour.to_i}" }
-   config.public_file_server.headers = {
-     'Cache-Control' => "public, max-age=#{1.hour.seconds.to_i}"
-   }

    # Show full error reports and disable caching.
-   config.consider_all_requests_local       = true
+   config.consider_all_requests_local = true
    config.action_controller.perform_caching = false
-   # Configure Active Storage
+   config.cache_store = :null_store
-   config.active_storage.service = :test

-   # Raise exceptions instead of rendering exception templates.
+   # Render exception templates for rescuable exceptions and raise for other exceptions.
-   config.action_dispatch.show_exceptions = false
+   config.action_dispatch.show_exceptions = :rescuable

    # Disable request forgery protection in test environment.
    config.action_controller.allow_forgery_protection = false
+
+   # Store uploaded files on the local file system in a temporary directory.
+   config.active_storage.service = :test
+
+   # Disable caching for Action Mailer templates even if Action Controller
+   # caching is enabled.
    config.action_mailer.perform_caching = false

    # Tell Action Mailer not to deliver emails to the real world.
    # The :test delivery method accumulates sent emails in the
    # ActionMailer::Base.deliveries array.
    config.action_mailer.delivery_method = :test
-   config.active_job.queue_adapter = :test

+   # Unlike controllers, the mailer instance doesn't have any context about the
+   # incoming request so you'll need to provide the :host parameter yourself.
+   config.action_mailer.default_url_options = { host: "www.example.com" }
+
    # Print deprecation notices to the stderr.
    config.active_support.deprecation = :stderr

-   # Disable Rack::Attack in test env to not throttle tests
+   # Raise exceptions for disallowed deprecations.
-   config.middleware.delete Rack::Attack
+   config.active_support.disallowed_deprecation = :raise

-   # Raises error for missing translations
+   # Tell Active Support which deprecation messages to disallow.
-   # config.action_view.raise_on_missing_translations = true
+   config.active_support.disallowed_deprecation_warnings = []
-   config.vapid_public_key = "BP0eSFqHWrs8xtF96UegaSl5rZJDbPkRen_9oQPZfq9q6iFmbwuELSKqm89qydRcG_F5xSsavxvbGyh_ci9_SQM="
-   config.vapid_private_key = "uGNkt259yGQDgGQYP1R4r3q1vTKkCddZe3rImyZvM4w="

-   config.action_mailer.default_url_options = { host: "example.com" }
+   # Raises error for missing translations.
-   config.assets.css_compressor = nil
+   # config.i18n.raise_on_missing_translations = true
+
+   # Annotate rendered view with file names.
+   # config.action_view.annotate_rendered_view_with_filenames = true
+
+   # Raise error when a before_action's only/except options reference missing actions.
+   config.action_controller.raise_on_missing_callback_actions = true
  end
