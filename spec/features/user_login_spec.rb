require 'rails_helper'

RSpec.describe "home page", :type => :feature do
  it "displays the user's username after successful login" do
    # user = User.create!(:email => "jdoe@jdoe.jdoe", :password => "secret")
    # get "/users/sign_in"
    # assert_select "form.new_user" do
    #   assert_select "input[name=?]", "user[email]"
    #   assert_select "input[name=?]", "user[password]"
    #   assert_select "input[type=?]", "submit"
    # end
    #
    # post "/users/sign_in", 'user[email]' => "jdoe@jdoe.jdoe", 'user[password]' => "secret"
    # assert_redirected_to '/rating/thanks'
    # assert_select ".welcome", :text => "Welcome, jdoe@jdoe.jdoe!"
    user = FactoryGirl.create(:user, :email => "jdoe@jdoe.jdoe", :password => "secret")
    visit "/users/sign_in"
    fill_in "Email", :with => "jdoe@jdoe.jdoe"
    fill_in "Password", :with => "secret"
    click_button "Log in"

    expect(page).to have_selector(".welcome", :text => "jdoe@jdoe.jdoe")
  end
end
