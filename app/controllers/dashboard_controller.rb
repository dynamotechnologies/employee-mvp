class DashboardController < ApplicationController

  def index
    query = params[:q]

    @date = Date.today

    if query.nil?
      @employees = Employee.all
    else
      @employees = Employee.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{query}%", "%#{query}%")
    end

  end
end
