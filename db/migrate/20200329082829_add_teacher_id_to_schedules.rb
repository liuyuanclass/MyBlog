class AddTeacherIdToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :teacher_id, :string
  end
end
