class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :depart_id
      t.text :describe

      t.timestamps
    end
  end
end
