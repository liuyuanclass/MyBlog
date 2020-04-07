class CreateClass1s < ActiveRecord::Migration[6.0]
  def change
    create_table :class1s do |t|
      t.string :class_id
      t.string :depart_id
      t.string :director_id

      t.timestamps
    end
  end
end
