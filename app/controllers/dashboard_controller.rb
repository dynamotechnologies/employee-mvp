class DashboardController < ApplicationController

  def index
    query = params[:q]
    @date = Date.today

    @employees = Employee.none.page(params[:page])
    if !query.nil?
      @employees = Employee.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{query}%", "%#{query}%").order(kudos_received: :desc).active.page(params[:page])
    end
  end
end
