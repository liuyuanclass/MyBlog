class AddClassTimeToTeachClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :teach_classes, :class_time, :string
  end
end
