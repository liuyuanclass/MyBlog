class CreateClass2s < ActiveRecord::Migration[6.0]
  def change
    create_table :class2s do |t|
      t.string :class2_id

      t.timestamps
    end
  end
end
