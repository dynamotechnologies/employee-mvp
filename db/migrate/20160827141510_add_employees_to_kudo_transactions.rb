class AddEmployeesToKudoTransactions < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :kudo_transactions, :employees, column: :to_id
    add_foreign_key :kudo_transactions, :employees, column: :from_id
    add_index :kudo_transactions, :to_id
    add_index :kudo_transactions, :from_id
  end
end
