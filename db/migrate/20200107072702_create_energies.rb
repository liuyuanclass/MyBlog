class CreateEnergies < ActiveRecord::Migration[6.0]
  def change
    create_table :energies do |t|
      t.string :dormitory
      t.integer :balance
      t.string :type

      t.timestamps
    end
  end
end
