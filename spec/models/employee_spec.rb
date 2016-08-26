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

  describe "Employees for leaderboard" do
    before :each do
      6.times do |i|
        FactoryGirl.create(:employee,
                           username: "jdoe_#{i}", email: "jdoe_#{i}@jdoe.jdoe",
                           password: "secret", password_confirmation: "secret",
                           first_name: "Joe_#{i}", last_name: "Doe", kudos_received: i)
      end
      @employees = Employee.for_leaderboard
    end

    it "returns only five" do
      expect(@employees.length).to eql(5)
    end

    it "returns them in the correct order" do
      expect(@employees.map { |em| em.username }).to eql ["jdoe_5", "jdoe_4", "jdoe_3", "jdoe_2", "jdoe_1"]
    end
  end
end
