class CreateInternets < ActiveRecord::Migration[6.0]
  def change
    create_table :internets do |t|
      t.string :user_id
      t.integer :balance
      t.string :type

      t.timestamps
    end
  end
end
