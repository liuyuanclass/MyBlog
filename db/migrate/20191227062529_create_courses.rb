class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_id
      t.string :describe

      t.timestamps
    end
  end
end
