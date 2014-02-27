#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require(:default)

def group book
  cum_volume = 0
  data = []
  book.each do |price, volume|
    cum_volume += volume.to_f
    if cum_volume >= (data.size**2)
      data << [price.to_f, cum_volume]
      cum_volume = 0
    end
  end
  data
end

order_book = Bitstamp.order_book
time = Time.at(order_book['timestamp'].to_i).utc
bids = group(order_book['bids'])
asks = group(order_book['asks'])
doc = {time: time, bids: bids, asks: asks}

session = Moped::Session.new([ "127.0.0.1:27017" ])
session.use "bitcoin-study"
session.login("bitcoin", ENV['DB_PWD']) if ENV['DB_PWD']
session[:order_book].insert doc
