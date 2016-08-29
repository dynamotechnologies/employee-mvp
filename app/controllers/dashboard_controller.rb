class DashboardController < ApplicationController

  def index
    query = params[:q]
    @date = Date.today

    @employees = Employee.none.page(params[:page])
    @employees = Employee.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{query}%", "%#{query}%").active.page(params[:page]) if !query.nil?

    @kudo_transactions = current_employee.kudo_transactions_for_month
  end

  def admin_index
    @employees = Employee.none.page(params[:page])
    @employees = Employee.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{query}%", "%#{query}%").active.page(params[:page]) if !query.nil?
  end

end
