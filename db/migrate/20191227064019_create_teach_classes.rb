class CreateTeachClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :teach_classes do |t|
      t.string :teacher_id
      t.string :course_id
      t.string :classroom_id

      t.timestamps
    end
  end
end
