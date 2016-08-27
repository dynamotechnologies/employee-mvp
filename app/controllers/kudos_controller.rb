class KudosController < ApplicationController
  before_action :set_kudo_transaction
  rescue_from ActiveRecord::RecordInvalid, with: :show_errors

  def give
    @kudo_transaction.give_kudos
  end

  private 
    def show_errors(exception)
      render json: exception.record.errors, status: :unprocessable_entity
    end

    def set_kudo_transaction
      @kudo_transaction = KudoTransaction.new(kudo_transaction_params)
      @kudo_transaction.from_id = current_employee.id
    end

    def kudo_transaction_params
      params.require(:kudo_transaction).permit(:to_id, :amount)
    end
end
