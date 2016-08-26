require 'rails_helper'

RSpec.describe "employee_edits/edit", type: :view do
  before(:each) do
    @employee_edit = assign(:employee_edit, EmployeeEdit.create!())
  end

  it "renders the edit employee_edit form" do
    render

    assert_select "form[action=?][method=?]", employee_edit_path(@employee_edit), "post" do
    end
  end
end
