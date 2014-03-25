require 'dotenv/tasks'

namespace :db do
  desc "Dump current database"
  task :dump => :dotenv do
    temp = 'tmp/dump'
    out = 'tmp'
    system "mkdir -p #{temp}"
    system "mongodump --db bitcoin-study -u bitcoin -p #{ENV['DB_PWD']} -o #{temp} > /dev/null"
    system "tar -cjf #{out}/bitcoin-study.tar.bz2 #{temp}"
    system "rm -r #{temp}"
  end
end