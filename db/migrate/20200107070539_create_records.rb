class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :user_id
      t.string :merchant_id
      t.integer :amount
      t.integer :balance

      t.timestamps
    end
  end
end
