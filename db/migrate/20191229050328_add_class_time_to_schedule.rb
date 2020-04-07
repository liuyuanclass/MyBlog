class AddClassTimeToSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :class_time, :string
  end
end
