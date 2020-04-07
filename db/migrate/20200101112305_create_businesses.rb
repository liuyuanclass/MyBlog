class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :business_id
      t.string :leader_id
      t.string :leader_name
      t.string :plan_url
      t.string :mentor
      t.string :state

      t.timestamps
    end
  end
end
