worker_processes 3

before_fork do |server, worker|
end

after_fork do |server, worker|
end
