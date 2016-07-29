ENV['RACK_ENV'] = 'test'
require "minitest/autorun"


require_relative "../stack/env"
require_relative "../stack/db"
DB.connect

require_relative "../application"

require 'rack/test'
Dir['./test/support/*.rb'].each { |file| require file }

# require "match_json"
