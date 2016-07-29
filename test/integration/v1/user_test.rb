require "test_helper"

describe V1::User do
  include Rack::Test::Methods

  def app
    Root
  end

  describe "GET /api/v1/users" do
    it do
      get "/api/v1/users"
      last_response.status.must_equal 200
    end
  end
end
