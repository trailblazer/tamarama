module V1
  module User
    class Endpoints < Grape::API
      resource :users do
        get  { "Index.(params).to_json" }
        post { Create.(params) }
      end
    end
  end
end
