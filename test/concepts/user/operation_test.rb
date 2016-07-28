require "test_helper"

module V1::User
  describe Create do
    it "runs successfully" do
      Create.(name: "Tiger")
    end
  end
end
