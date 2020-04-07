class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :account_id
      t.string :password
      t.integer :balance

      t.timestamps
    end
  end
end
