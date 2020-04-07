class ChangeToEnergy < ActiveRecord::Migration[6.0]
  def change
    rename_column :energies,:type,:merchant
    rename_column :internets,:type,:merchant
  end
end
