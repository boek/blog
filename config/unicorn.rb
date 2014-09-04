# Set the working application directory
# working_directory "/path/to/your/app"
root = "/home/jeffboek/www/blog"
working_directory root

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "#{root}/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/tmp/logs/unicorn.log"
stdout_path "/tmp/logs/unicorn.log"

# Unicorn socket
# listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.blog.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30