environment = ENV['RACK_ENV'] ||= 'development'

require 'dotenv'
Dotenv.load(".env.#{environment}")

Bundler.require :default, environment
