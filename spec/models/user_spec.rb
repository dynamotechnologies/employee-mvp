require 'spec_helper'

describe User do
  it "cannot have an empty email" do
    user = User.new
    expect(user.save).to be_falsey
    expect(user.errors[:email]).to eql(["can't be blank"])
  end

  it "cannot have an empty password" do
    user = User.new email: 'x@y.z'
    expect(user.save).to be_falsey
    expect(user.errors[:password]).to eql(["can't be blank"])
  end
end
