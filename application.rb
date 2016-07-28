$LOAD_PATH.unshift(File.dirname(__FILE__))

require "stack/env"
require "stack/db"

require "trailblazer/operation"
require "trailblazer/operation/model"
require "trailblazer/operation/representer"
# require "reform/form/active_model/validations"
# require "reform/form/coercion"
require "roar/json"

Reform::Form.class_eval do
  require "reform/form/dry"
  include Reform::Form::Dry

  require "disposable/twin/property/hash"
  # include Disposable::Twin::Property::Hash # FIXME: not inherited!
end

Trailblazer::Loader.new.(debug: false, concepts_root: "./concepts/") { |file|
  puts file
  require_relative(file) }

# temporary monkey-patches for V1::Operation
require "trailblazer/operation/policy"
# Trailblazer::Operation.send :include, V1::Operation::CurrentUser
