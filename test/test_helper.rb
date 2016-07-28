ENV['RACK_ENV'] = 'test'

require_relative "../stack/env"
require_relative "../stack/db"
DB.connect

require_relative "../application"

require 'rack/test'
Dir['./spec/support/*.rb'].each { |file| require file }


# require "match_json"
