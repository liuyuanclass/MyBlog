class ChangColumnToAccountPasswordPasswordDigest < ActiveRecord::Migration[6.0]
  def change
    rename_column :accounts, :password, :password_digest
  end
end
