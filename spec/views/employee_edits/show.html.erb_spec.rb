require 'rails_helper'

RSpec.describe "employee_edits/show", type: :view do
  before(:each) do
    @employee_edit = assign(:employee_edit, EmployeeEdit.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
