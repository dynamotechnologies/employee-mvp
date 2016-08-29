class CreateKudoCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :kudo_categories do |t|
      t.string :name, null: false
      t.timestamps
    end

    add_belongs_to :kudo_transactions, :kudo_categories
  end
end
