module V1
  module User
    class Create < Trailblazer::Operation
      model ::User::Persistence, :create

    end
  end
end
