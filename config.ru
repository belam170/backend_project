require_relative './config/environment'

require 'rack/cors'

use Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '*', headers: :any, methods: [:get, :post, :patch, :delete, :options]
  end
end

# Your other server code...


# Parse JSON from the request body into the params hash
use Rack::JSONBodyParser

run ApplicationController