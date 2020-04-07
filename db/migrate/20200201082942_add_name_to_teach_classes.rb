class AddNameToTeachClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :teach_classes, :name, :string
  end
end
