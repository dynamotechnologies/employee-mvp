class AddReasonToKudoTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :kudo_transactions, :reason, :text, limit: 256
  end
end
