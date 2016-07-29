module V1
  module User
    class Index < Trailblazer::Operation
      # include Search::Tag

      def process(params)
        # use #validate if you want
        # use query object if you want
        @model = ::User::Persistence.all
      end

      require "trailblazer/operation/representer"

      include Trailblazer::Operation::Representer
      # include Representer::Rendering

      representer do
        include Roar::JSON

        collection :to_a, as: :users do
          property :id
        end
      end
    end
  end
end
