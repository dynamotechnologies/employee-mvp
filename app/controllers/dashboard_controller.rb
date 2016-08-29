class DashboardController < ApplicationController

  def index
    if current_employee.is_admin
      redirect_to employee_edits_path
    else
      query = params[:q]
      @date = Date.today

      @employees = Employee.none.page(params[:page])
      @employees = Employee.active_users.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{query}%", "%#{query}%").active.page(params[:page]) if !query.nil?

      @kudo_transactions = current_employee.kudo_transactions_for_month
    end
  end

end
