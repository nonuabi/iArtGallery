# config/puma.rb

# Specifies the number of threads per worker
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Specifies the port to listen on (useful for debugging)
port        ENV.fetch("PORT") { 3000 }

# Specifies the environment that Puma will run in
environment ENV.fetch("RAILS_ENV") { "production" }

# Specifies the PID file location
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Specifies the number of worker processes to boot in clustered mode
# Workers are forked web server processes. If using threads and workers together,
# the concurrency of the application will be `threads * workers`.
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
preload_app!

# Allows puma to be restarted by `rails restart` command.
plugin :tmp_restart
