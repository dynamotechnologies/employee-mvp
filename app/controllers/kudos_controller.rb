class KudosController < ApplicationController
  include KudosHelper
  before_action :set_kudo_transaction

  def give
    give_kudos @kudo_transaction
  end

  private 
    def set_kudo_transaction
      @kudo_transaction = KudoTransaction.new(kudo_transaction_params)
      @kudo_transaction.from_id = current_employee.id
    end

    def kudo_transaction_params
      params.require(:kudo_transaction).permit(:to_id, :amount)
    end
end
