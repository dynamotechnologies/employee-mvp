require 'rails_helper'

RSpec.describe EmployeeEditsController, type: :controller do

  before :each do
    @regular_user = FactoryGirl.create(:employee,
                                       username: "jdoe", email: "jdoe1@jdoe.jdoe",
                                       password: "secret", password_confirmation: "secret",
                                       first_name: "Joe1", last_name: "Doe", kudos_received: 0, is_admin: false)
    @admin_user = FactoryGirl.create(:employee,
                                     username: "jdoe_admin", email: "jdoe@jdoe.jdoe",
                                     password: "secret", password_confirmation: "secret",
                                     first_name: "Joe", last_name: "Doe", kudos_received: 0, is_admin: true)
  end

  describe "GET #index" do
    it "allows an admin user" do
      sign_in @admin_user
      get :index
      expect(response.code).to eq("200")
    end

    it "disallows a regular user" do
      sign_in @regular_user
      get :index
      expect(response.code).to eq("302")
    end

    it "disallows when no user is logged in" do
      get :index
      expect(response.code).to eq("302")
    end
  end

end
