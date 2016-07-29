module V1
  module User
    class Create < Trailblazer::Operation
      include Model
      model ::User::Persistence, :create

      include Trailblazer::Operation::Representer
      representer Representer::Create
      # representer :error, Tamarama::Representer::Error

      contract do
        property :name
      end


      def process(params)
        validate(params) do
          puts contract.inspect
          contract.save
        end
        # raise params.inspect
      end
    end
  end
end
