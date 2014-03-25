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

  desc "Download production database"
  task :pull do
    system "scp deploy@pi.rootbox.fr:~/bitcoin-study/shared/tmp/bitcoin-study.tar.bz2 tmp"
  end

  desc "Load dump into local database"
  task :load do
    puts "extracting archive"
    system "tar -xjf tmp/bitcoin-study.tar.bz2 tmp/"
    puts "restoring data"
    system "mongorestore --db bitcoin-study --drop tmp/dump/bitcoin-study > /dev/null"
    system "rm -r tmp/bitcoin-study.tar.bz2 tmp/dump"
  end

  desc "Pull and load production dump into local database"
  task :import => [:pull, :load]
end