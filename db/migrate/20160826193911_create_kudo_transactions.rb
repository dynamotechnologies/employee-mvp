class CreateKudoTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :kudo_transactions do |t|
      t.integer :from_id
      t.integer :to_id
      t.integer :amount

      t.timestamps
    end
  end
end
