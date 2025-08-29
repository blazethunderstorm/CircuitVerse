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

# The default is set to 3 threads as it's deemed a decent compromise between
# Any libraries that use a connection pool or another resource pool should
# be configured to provide at least as many connections as the number of
# threads. This includes Active Record's `pool` parameter in `database.yml`.
threads_count = ENV.fetch("RAILS_MAX_THREADS", 3)
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
port ENV.fetch("PORT", 3000)


# Allow puma to be restarted by `bin/rails restart` command.
  plugin :tmp_restart

# Specify the PID file. Defaults to tmp/pids/server.pid in development.
# In other environments, only set the PID file if requested.
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]
