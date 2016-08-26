require 'rails_helper'

RSpec.describe Rating, type: :model do
  it "cannot have an empty giver" do
    rating = Rating.new desc: "abcdefhijklmnop"
    expect(rating.save).to be_falsey
    expect(rating.errors[:giver]).to eql(["can't be blank"])
  end

  it "cannot have an empty receiver" do
    rating = Rating.new desc: "abcdefhijklmnop"
    expect(rating.save).to be_falsey
    expect(rating.errors[:receiver]).to eql(["can't be blank"])
  end

  it "cannot have an empty desc" do
    rating = Rating.new
    expect(rating.save).to be_falsey
    expect(rating.errors[:desc]).to eql(["can't be blank", "is too short (minimum is 10 characters)"])
  end

  it "cannot have too short a description" do
    rating = Rating.new giver: "Fred Smith", receiver: "John Jones", desc: "X"
    expect(rating.save).to be_falsey
    expect(rating.errors[:desc]).to eql(["is too short (minimum is 10 characters)"])
  end

  it "cannot have too long of a description" do
    rating = Rating.new giver: "Fred Smith", receiver: "John Jones", desc: ("X" * 250)
    expect(rating.save).to be_falsey
    expect(rating.errors[:desc]).to eql(["is too long (maximum is 140 characters)"])
  end
end
