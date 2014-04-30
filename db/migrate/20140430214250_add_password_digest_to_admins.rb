class AddPasswordDigestToAdmins < ActiveRecord::Migration
  
  def up
    remove_column :admins, :password
    add_column :admins, :password_digest, :string
  end
  
  def down
    remove_column :admins, :password_digest
    add_column :admins, :password, :string
  end
  
end
