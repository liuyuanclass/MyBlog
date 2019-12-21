class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :teacher_id
      t.string :name
      t.string :role
      t.string :sex
      t.string :adress
      t.string :phone

      t.timestamps
    end
  end
end
