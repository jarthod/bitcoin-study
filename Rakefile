namespace :db do
  desc "Dump current database"
  task :dump do
    temp = 'tmp/dump'
    out = 'tmp'
    system "mkdir -p #{temp}"
    system "mongodump --db bitcoin-study -o #{temp} > /dev/null"
    system "tar -cjf #{out}/bitcoin-study.tar.bz2 #{temp}"
    system "rm -r #{temp}"
  end
end