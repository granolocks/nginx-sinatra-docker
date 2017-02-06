# set path to app that will be used to configure unicorn,
# note the trailing slash in this example
DIR = "/app/"
SOCK_FILE   = "#{DIR}tmp/sockets/unicorn.sock"
PID_FILE    = "#{DIR}tmp/pids/unicorn.pid"
STDERR_PATH = "#{DIR}log/unicorn.stderr.log"
STDOUT_PATH = "#{DIR}log/unicorn.stdout.log"

[PID_FILE, SOCK_FILE].each do |f|
  if File.exists?(f)
    File.unlink(f)
  end
end

#cleanup
worker_processes 2
working_directory DIR

timeout 30

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen SOCK_FILE, :backlog => 64

# Set process id path
pid PID_FILE

# Set log file paths
stderr_path STDERR_PATH
stdout_path STDOUT_PATH
