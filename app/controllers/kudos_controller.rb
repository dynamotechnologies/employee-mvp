class KudosController < ApplicationController
  include KudosHelper

  def give
    to = Employee.find(params[:to])
    amount = params[:amount].to_f

    begin
      give_kudos(current_employee, to, amount)
      response = {balance: current_employee.kudo_balance, to: to}
      status = 200
    rescue
      response = {message: 'Balance too low'}
      status = 412
    end


    respond_to do |format|
      format.json {
        render json: response, status: status
      }
    end

  end

end
