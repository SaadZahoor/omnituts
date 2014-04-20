class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|
      t.string "first_name", :null => false
      t.string "last_name", :null => false
      t.string "username", :null => false
      t.string "password", :null => false
      t.string "email", :null => false
      t.integer "num_of_courses", :default => 0
      t.timestamps
    end
    add_index("users", "username")
    add_index("users", "email")
  end

  def down
    drop_table :users
  end

end
