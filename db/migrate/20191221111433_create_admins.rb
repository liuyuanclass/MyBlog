class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :admin_id
      t.string :name
      t.string :role
      t.string :sex
      t.text :adress
      t.string :phone

      t.timestamps
    end
  end
end
