$LOAD_PATH.unshift(File.dirname(__FILE__))

require "stack/env"
require "stack/db"

require 'openssl'
require 'base64'
# require 'elasticsearch'
# require 'sidekiq'


# $logger = Logger.new(STDOUT) #LogStashLogger.new(host:"docker", port: 5000)
# $logger.info "Starting mitimes/api in #{ENV['RACK_ENV']}"
# $logger.info "Current folder #{File.dirname(__FILE__)}"
# $logger.info "Connecting to database #{ENV['RACK_ENV'] == 'test' ? ENV['TEST_DATABASE_URL'] : ENV['DATABASE_URL']}"
# $logger.info "Loading Private Key at #{ENV['PRIVATE_KEY_PATH']}" if ENV['PRIVATE_KEY_PATH']

require "trailblazer/operation"
require "trailblazer/operation/model"
require "trailblazer/operation/representer"
# require "reform/form/active_model/validations"
# require "reform/form/coercion"
require "roar/json"

Reform::Form.class_eval do
  # include Reform::Form::ActiveModel::Validations
  # include Reform::Form::Coercion
  require "reform/form/dry"
  include Reform::Form::Dry

  require "disposable/twin/property/hash"
  # include Disposable::Twin::Property::Hash # FIXME: not inherited!
end

# Dir['./app/helpers/*.rb'].each { |file| require file }

# require_relative "../app/controllers/api/v1/matter.rb"
# require_relative "../app/concepts/v2/operation/tags_search.rb"

Dir['./api-ch-models/lib/models/v1/*.rb'].each { |file| require file }
# require_relative "api-ch-models/lib/models/v1/matter"


Trailblazer::Loader.new.(debug: false, concepts_root: "./concepts/") { |file|
  puts file
  require_relative(file) }

# temporary monkey-patches for V1::Operation
require "trailblazer/operation/policy"
Trailblazer::Operation.send :include, V1::Operation::CurrentUser
Trailblazer::Operation.send :include, V1::Operation::Log
Trailblazer::Operation.send :include, V1::Operation::UUID
Trailblazer::Operation.send :include, V1::Operation::Process # TODO: introduce callbavck o


