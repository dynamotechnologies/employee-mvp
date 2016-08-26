require 'rails_helper'

RSpec.describe "employee_edits/new", type: :view do
  before(:each) do
    assign(:employee_edit, EmployeeEdit.new())
  end

  it "renders new employee_edit form" do
    render

    assert_select "form[action=?][method=?]", employee_edits_path, "post" do
    end
  end
end
