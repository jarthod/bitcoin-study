#!/usr/bin/env ruby

require 'bundler/setup'
Bundler.require(:default)

session = Moped::Session.new([ "127.0.0.1:27017" ])
session.use "bitcoin-study"
session.login("bitcoin", ENV['DB_PWD']) if ENV['DB_PWD']
session[:order_book].insert Bitstamp.order_book