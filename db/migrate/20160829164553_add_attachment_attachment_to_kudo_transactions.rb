class AddAttachmentAttachmentToKudoTransactions < ActiveRecord::Migration
  def self.up
    change_table :kudo_transactions do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :kudo_transactions, :attachment
  end
end
