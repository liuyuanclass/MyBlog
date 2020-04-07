class AddClassIdToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :class_id, :string
  end
end
