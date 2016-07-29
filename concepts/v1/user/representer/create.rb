module V1
  module User
    module Representer
      class Create < Roar::Decorator
        include Roar::JSON
        include Roar::Hypermedia

        property :name

        link(:self) { "/api/v1/users/#{represented.id}" }
      end
    end
  end
end
