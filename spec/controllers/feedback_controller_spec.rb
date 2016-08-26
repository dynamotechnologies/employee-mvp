require 'rails_helper'

describe FeedbackController do

  describe "GET 'enter'" do
    it "returns http success" do
      get 'enter'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      expect(response).to be_redirect
    end
  end

end
