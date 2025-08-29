- # Puma can serve each request in a thread from an internal thread pool.
# This configuration file will be evaluated by Puma. The top-level methods that
- # The `threads` method setting takes two numbers: a minimum and maximum.
# are invoked here are part of Puma's configuration DSL. For more information
- # Any libraries that use thread pools should be configured to match
# about methods provided by the DSL, see https://puma.io/puma/Puma/DSL.html.
- # the maximum value specified for Puma. Default is set to 5 threads for minimum
- # and maximum; this matches the default thread size of Active Record.
- #
- threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
- threads threads_count, threads_count

- # Specifies the `port` that Puma will listen on to receive requests; default is 3000.
# Puma starts a configurable number of processes (workers) and each process
# serves each request in a thread from an internal thread pool.
  #
- port        ENV.fetch("PORT") { 3000 }
# The ideal number of threads per worker depends both on how much time the
-
# application spends waiting for IO operations and on how much you wish to
- # Specifies the `environment` that Puma will run in.
# to prioritize throughput over latency.
  #
- environment ENV.fetch("RAILS_ENV") { "development" }
# As a rule of thumb, increasing the number of threads will increase how much
-
# traffic a given process can handle (throughput), but due to CRuby's
- # Specifies the number of `workers` to boot in clustered mode.
# Global VM Lock (GVL) it has diminishing returns and will degrade the
- # Workers are forked webserver processes. If using threads and workers together
# response time (latency) of the application.
- # the concurrency of the application would be max `threads` * `workers`.
- # Workers do not work on JRuby or Windows (both of which do not support
- # processes).
  #
- workers ENV.fetch("WEB_CONCURRENCY") { 0 }
# The default is set to 3 threads as it's deemed a decent compromise between
-
# throughput and latency for the average Rails application.
- # Use the `preload_app!` method when specifying a `workers` number.
- # This directive tells Puma to first boot the application and load code
- # before forking the application. This takes advantage of Copy On Write
- # process behavior so workers use less memory. If you use this option
- # you need to make sure to reconnect any threads in the `on_worker_boot`
- # block.
  #
- preload_app!
# Any libraries that use a connection pool or another resource pool should
# be configured to provide at least as many connections as the number of
# threads. This includes Active Record's `pool` parameter in `database.yml`.
threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch("PORT", 3000)

- # Allow puma to be restarted by `rails restart` command.
# Allow puma to be restarted by `bin/rails restart` command.
  plugin :tmp_restart

# Specify the PID file. Defaults to tmp/pids/server.pid in development.
# In other environments, only set the PID file if requested.
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
