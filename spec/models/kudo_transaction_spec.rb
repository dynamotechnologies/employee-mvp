require 'rails_helper'

RSpec.describe KudoTransaction, type: :model do
  let(:regular_user) {
     Employee.new(id: 1,  email: "jdoe1@jdoe.jdoe",
                  password: "secret", password_confirmation: "secret",
                  first_name: "Joe1", last_name: "Doe", is_admin: false)
   }

   let(:admin_user) {
     Employee.new(id: 2, email: "jdoe_admin@jdoe.jdoe",
                  password: "secret", password_confirmation: "secret",
                  first_name: "Joe", last_name: "Doe", is_admin: true)
   }

  it "can create a valid kudo transaction" do
    kudo = KudoTransaction.new from: admin_user, to: regular_user, amount: 5
    expect(kudo).to be_valid
  end

  it "must have a from id" do
    kudo = KudoTransaction.new from: admin_user, to: regular_user, amount: 5
    expect(kudo).to be_valid

    kudo.from_id = nil
    expect(kudo).to_not be_valid
    expect(kudo.errors[:from_id].size).to eq(1)
  end

  it "must have a to id" do
    kudo = KudoTransaction.new from: admin_user, to: regular_user, amount: 5
    expect(kudo).to be_valid

    kudo.to_id = nil
    expect(kudo).to_not be_valid
    expect(kudo.errors[:to_id].size).to eq(1)
  end

  it "will allow giving all kudos to someone" do
    kudo = KudoTransaction.new from: admin_user, to: regular_user, amount: 5
    expect(kudo).to be_valid

    kudo.amount = 100
    expect(kudo).to be_valid
  end

  it "should not allow reason text over 256" do
    kudo = KudoTransaction.new from: admin_user, to: regular_user, amount: 5, reason: "hi there"
    expect(kudo).to be_valid

    kudo.reason = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,11"
    expect(kudo).to_not be_valid
  end
end
