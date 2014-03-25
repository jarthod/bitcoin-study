set :output, "log/cron.log"
set :whenever_identifier, "bitcoin-study"

job_type :rake, "cd :path && bundle exec rake :task --silent :output"
job_type :script, "cd :path && bundle exec :task :output"

every 6.hours do
  rake "db:dump"
end

every 1.minute do
  script './orderbook.rb'
end
