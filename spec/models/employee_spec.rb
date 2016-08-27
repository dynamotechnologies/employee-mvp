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

  describe "Full name" do
    it "returns only five" do
      employee = Employee.new first_name: "James", last_name: "Dean"
      expect(employee.fullname).to eql("James Dean")
    end
  end

  describe "Leaders" do
    before :each do
      @user1 = FactoryGirl.create(:employee,
                           username: "jdoe", email: "jdoe@jdoe.jdoe",
                           password: "secret", password_confirmation: "secret",
                           first_name: "Joe", last_name: "Doe", kudos_received: 100, kudo_balance: 5)

      @user2 = FactoryGirl.create(:employee,
                           username: "jdoe1", email: "jdoe1@jdoe.jdoe",
                           password: "secret", password_confirmation: "secret",
                           first_name: "Joe2", last_name: "Doe", kudos_received: 1, kudo_balance: 5)

      @kudo1 = FactoryGirl.create(:kudo_transaction, to_id: @user1.id, from_id: @user2.id, amount: 1)
      @kudo2 = FactoryGirl.create(:kudo_transaction, to_id: @user2.id, from_id: @user1.id, amount: 2)
    end

    it "can find the leader for this month" do
      expect(KudoTransaction).to receive(:max_receiver_for_month).and_return([@kudo1])
      employees = Employee.leader_this_month
      expect(employees[0].fullname).to eql("Joe Doe")
    end

    it "can find the leader for last month" do
      expect(KudoTransaction).to receive(:max_receiver_for_month).and_return([@kudo2])
      employees = Employee.leader_last_month
      expect(employees[0].fullname).to eql("Joe2 Doe")
    end
  end
end
