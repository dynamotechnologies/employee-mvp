class KudosController < ApplicationController
  include KudosHelper

  def give
    to = Employee.find(params[:to])
    amount = params[:amount].to_f
    give_kudos(current_employee, to, amount)


    respond_to do |format|
      format.json {
        render json: {balance: current_employee.kudo_balance, to: to}
      }
    end

  end

end
