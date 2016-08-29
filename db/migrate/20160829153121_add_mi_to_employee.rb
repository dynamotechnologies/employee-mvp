class AddMiToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :middle_initial, :text, limit: 5
    remove_column :employees, :kudo_balance
    remove_column :employees, :kudos_received
  end
end
