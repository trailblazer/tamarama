require "test_helper"

describe V1::User do
  include Rack::Test::Methods

  def app
    Root
  end

  describe "POST /api/v1/users" do
    it do
      post "/api/v1/users", { name: "Fran" }.to_json

      last_response.body.must_equal ""
      last_response.status.must_equal 302
      last_response.url.must_equal "/api/v1/users/1"
      # assert_equal "http://example.org/yourexpecedpath", last_request.url
    end
  end

  describe "GET /api/v1/users" do
    it do
      get "/api/v1/users"
      last_response.status.must_equal 200
      last_response.body.must_equal "bla"
    end
  end
end
