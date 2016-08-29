require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe "Creation" do
    it "cannot have an empty email" do
      employee = Employee.new
      expect(employee.save).to be_falsey
      expect(employee.errors[:email]).to eql(["can't be blank"])
    end

    it "cannot have an empty password" do
      employee = Employee.new email: 'x@y.z'
      expect(employee.save).to be_falsey
      expect(employee.errors[:password]).to eql(["can't be blank"])
    end
  end

  describe "Full name" do
    it "returns the correct full name" do
      employee = Employee.new first_name: "James", last_name: "Dean"
      expect(employee.fullname).to eql("James Dean")
    end
  end

end
