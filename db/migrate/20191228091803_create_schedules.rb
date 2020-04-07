class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :student_id
      t.string :teachclass_id

      t.timestamps
    end
  end
end
