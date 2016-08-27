class DashboardController < ApplicationController

  def index
    query = params[:q]
    @date = Date.today

    if query.nil?
      @employees = Employee.active.order(kudos_received: :desc)
    else
      @employees = Employee.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{query}%", "%#{query}%").order(kudos_received: :desc).active
    end
  end
end
