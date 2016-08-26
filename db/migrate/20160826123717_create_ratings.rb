class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.string :giver
      t.string :receiver
      t.string :desc

      t.timestamps
    end
  end
end
