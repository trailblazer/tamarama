module V1
  module User
    class Endpoints < Grape::API
      resource :users do
        get  { Index.(params) }
        post { Create.(request.body.read) }
      end
    end
  end
end
