require 'rails_helper'

RSpec.describe KudosController, type: :controller do
  render_views

  before :each do
    @regular_user = FactoryGirl.create(:employee,
                                       username: "jdoe", email: "jdoe1@jdoe.jdoe",
                                       password: "secret", password_confirmation: "secret",
                                       first_name: "Joe1", last_name: "Doe", kudo_balance: 100, is_admin: false)

    @admin_user = FactoryGirl.create(:employee,
                                     username: "jdoe_admin", email: "jdoe@jdoe.jdoe",
                                     password: "secret", password_confirmation: "secret",
                                     first_name: "Joe", last_name: "Doe", kudo_balance: 100, is_admin: true)
  end

  describe "POST #kudos" do
    it "allows kudo transfer" do
      sign_in @admin_user
      post :give, params: {kudo_transaction: {to_id: @regular_user.id, amount: 5}, format: :json}

      resp = JSON.parse(response.body)
      expect(response.code).to eq("200")
      expect(resp['from_id']).to eq(@admin_user.id)
      expect(resp['to_id']).to eq(@regular_user.id)
      expect(resp['amount']).to eq(5)
    end

    it "should not allow kudo transfer if not enough balance" do
      sign_in @admin_user
      post :give, params: {kudo_transaction: {to_id: @regular_user.id, amount: 500}, format: :json}

      resp = JSON.parse(response.body)
      expect(response.code).to eq("422")
      expect(resp['amount']).to eq(["is more than kudos remaining"])
    end
  end

end
