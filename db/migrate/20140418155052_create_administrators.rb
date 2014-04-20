class CreateAdministrators < ActiveRecord::Migration

  def up
    create_table :administrators do |t|
      t.string "username", :limit => 35, :null => false
      t.string "password", :limit => 40, :null => false
      t.string "first_name", :null => false
      t.string "last_name", :null => false
      t.string "email", :null => false
      t.integer "tutorials", :default => 0
      t.timestamps
    end
  end

  def down
    drop_table :administrators
  end

end
