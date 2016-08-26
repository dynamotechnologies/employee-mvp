require "rails_helper"

RSpec.describe EmployeeEditsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/employee_edits").to route_to("employee_edits#index")
    end

    it "routes to #new" do
      expect(:get => "/employee_edits/new").to route_to("employee_edits#new")
    end

    it "routes to #show" do
      expect(:get => "/employee_edits/1").to route_to("employee_edits#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/employee_edits/1/edit").to route_to("employee_edits#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/employee_edits").to route_to("employee_edits#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/employee_edits/1").to route_to("employee_edits#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/employee_edits/1").to route_to("employee_edits#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/employee_edits/1").to route_to("employee_edits#destroy", :id => "1")
    end

  end
end
