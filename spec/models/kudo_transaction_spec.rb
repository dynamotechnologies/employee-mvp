require 'rails_helper'

RSpec.describe KudoTransaction, type: :model do
  let(:regular_user) {
     Employee.new(id: 1, username: "jdoe", email: "jdoe1@jdoe.jdoe",
                  password: "secret", password_confirmation: "secret",
                  first_name: "Joe1", last_name: "Doe", kudo_balance: 100, is_admin: false)
   }

   let(:admin_user) {
     Employee.new(id: 2, username: "jdoe_admin", email: "jdoe@jdoe.jdoe",
                  password: "secret", password_confirmation: "secret",
                  first_name: "Joe", last_name: "Doe", kudo_balance: 100, is_admin: true)
   }

  it "can create a valid kudo transaction" do
    kudo = KudoTransaction.new from: admin_user, to: regular_user, amount: 5
    expect(Employee).to receive(:find).and_return(admin_user)
    expect(kudo).to be_valid
  end

  it "must have a from id" do
    kudo = KudoTransaction.new from: admin_user, to: regular_user, amount: 5
    expect(Employee).to receive(:find).and_return(admin_user)
    expect(kudo).to be_valid

    kudo.from_id = nil
    expect(Employee).to receive(:find).and_return(admin_user)
    expect(kudo).to_not be_valid
    expect(kudo.errors[:from_id].size).to eq(1)
  end

  it "must have a to id" do
    kudo = KudoTransaction.new from: admin_user, to: regular_user, amount: 5
    expect(Employee).to receive(:find).and_return(admin_user)
    expect(kudo).to be_valid

    kudo.to_id = nil
    expect(Employee).to receive(:find).and_return(admin_user)
    expect(kudo).to_not be_valid
    expect(kudo.errors[:to_id].size).to eq(1)
  end

  it "must have enough balance to give kudos" do
    kudo = KudoTransaction.new from: admin_user, to: regular_user, amount: 5
    expect(Employee).to receive(:find).and_return(admin_user)
    expect(kudo).to be_valid

    kudo.amount = 101
    expect(Employee).to receive(:find).and_return(admin_user)
    expect(kudo).to_not be_valid
    expect(kudo.errors[:amount].size).to eq(1)
  end

  it "will allow giving all kudos to someone" do
    kudo = KudoTransaction.new from: admin_user, to: regular_user, amount: 5
    expect(Employee).to receive(:find).and_return(admin_user)
    expect(kudo).to be_valid

    kudo.amount = 100
    expect(Employee).to receive(:find).and_return(admin_user)
    expect(kudo).to be_valid
  end
end
