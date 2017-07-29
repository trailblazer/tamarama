environment = ENV['RACK_ENV'] ||= 'development'

require 'dotenv'
Dotenv.load(".env.#{environment}")

require 'bundler'
Bundler.require :default, environment
