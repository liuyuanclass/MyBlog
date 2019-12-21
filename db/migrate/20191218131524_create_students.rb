class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :student_id
      t.string :name
      t.string :role
      t.string :sex
      t.string :dormitory
      t.string :phone

      t.timestamps
    end
  end
end
