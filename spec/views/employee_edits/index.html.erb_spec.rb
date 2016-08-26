require 'rails_helper'

RSpec.describe "employee_edits/index", type: :view do
  before(:each) do
    assign(:employee_edits, [
      EmployeeEdit.create!(),
      EmployeeEdit.create!()
    ])
  end

  it "renders a list of employee_edits" do
    render
  end
end
