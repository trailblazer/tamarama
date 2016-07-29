require "test_helper"

describe "V1::User::Create" do
  it "runs successfully" do
    V1::User::Create.(name: "Tiger").must_equal 1
  end
end

class UserCreateTest < Minitest::Spec
  it "runs successfully" do
    V1::User::Create.(name: "Tiger").must_equal 1
  end
end
