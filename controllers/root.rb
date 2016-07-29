class Root < Grape::API
  # before do
  #   header "Access-Control-Allow-Origin", "*"
  # end

  # helpers ::Helpers::Request
  format :json
  formatter :json, Grape::Formatter::Roar
  prefix :api

  version :v1 do
    mount V1::User::Endpoints
  end
end
