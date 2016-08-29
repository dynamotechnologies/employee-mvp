require 'rails_helper'

RSpec.describe KudosController, type: :controller do
  render_views

  before :each do
    @regular_user = FactoryGirl.create(:employee,
                                       email: "jdoe1@jdoe.jdoe",
                                       password: "secret", password_confirmation: "secret",
                                       first_name: "Joe1", last_name: "Doe", is_admin: false)

    @admin_user = FactoryGirl.create(:employee,
                                     email: "jdoe_admin@jdoe.jdoe",
                                     password: "secret", password_confirmation: "secret",
                                     first_name: "Joe", last_name: "Doe", is_admin: true)
  end

end
