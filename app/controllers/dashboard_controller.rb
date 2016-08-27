class DashboardController < ApplicationController

  def index
    query = params[:q]
    @date = Date.today

    @employees = []
    if !query.nil?
      @employees = Employee.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{query}%", "%#{query}%").order(kudos_received: :desc).active
    end
  end
end
