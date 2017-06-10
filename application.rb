$LOAD_PATH.unshift(File.dirname(__FILE__))

require "stack/env"
require "stack/db"

require "trailblazer/operation"
require "trailblazer/operation/model"
require "trailblazer/operation/representer"
# require "reform/form/active_model/validations"
# require "reform/form/coercion"

Reform::Form.class_eval do
  require "reform/form/dry"
  include Reform::Form::Dry

  require "disposable/twin/property/hash"
  # include Disposable::Twin::Property::Hash # FIXME: not inherited!
end

#Dir['./models/v1/*.rb'].each { |file| require file }

Trailblazer::Loader.new.(debug: false, concepts_root: "./concepts/") { |file|
  puts file
  require_relative(file) }

