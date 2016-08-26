class KudosController < ApplicationController
  include KudosHelper

  def give
    to = Employee.find(params[:to])
    give_kudos(current_employee, to, 2)


    respond_to do |format|
      format.json {
        render json: {balance: current_employee.kudo_balance, to: to}
      }
    end

  end

end
