require 'rack'
require 'rack/contrib'
require 'rack/cors'

use Rack::Reloader
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :options, :put]
  end
end

require_relative "boot"
run API::Root
