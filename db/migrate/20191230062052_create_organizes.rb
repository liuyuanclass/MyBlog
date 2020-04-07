class CreateOrganizes < ActiveRecord::Migration[6.0]
  def change
    create_table :organizes do |t|
      t.string :student_id
      t.string :community_id

      t.timestamps
    end
  end
end
