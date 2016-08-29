class KudosController < ApplicationController
  before_action :set_kudo_transaction, only: [:create]
  rescue_from ActiveRecord::RecordInvalid, with: :show_errors

  def index
    params[:order] = params[:order] || 'created_at DESC'

    @kudos = KudoTransaction.where('reason ILIKE ?', "%#{params[:reason]}%").order(params[:order]).page(params[:page])
  end

  def create
    @kudo_transaction.give_kudos
    respond_to do |format|
      format.html { redirect_to(dashboard_path) }
      format.json
    end
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
      params.require(:kudo_transaction).permit(:to_id, :amount, :reason, :attachment, :kudo_categories_id)
    end
end
