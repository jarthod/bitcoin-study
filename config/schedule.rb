set :output, "log/cron.log"
set :whenever_identifier, "bitcoin-study"

every 6.hours do
  # command "/usr/bin/some_great_command"
  rake "db:dump"
end

every 1.minute do
  command './orderbook.rb'
end
