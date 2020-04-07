class CreateCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :communities do |t|
      t.string :community_id
      t.string :leader
      t.string :describe

      t.timestamps
    end
  end
end
