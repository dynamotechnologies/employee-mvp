class AddMonthAndYearToKudoTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :kudo_transactions, :month, :integer
    add_column :kudo_transactions, :year, :integer
    add_index :kudo_transactions, :month
    add_index :kudo_transactions, :year

    execute <<-SQL
    update kudo_transactions set month = date_part('month', created_at), year = date_part('year', created_at);
    SQL
  end
end
