class CreateAdmins < ActiveRecord::Migration

  def up
    create_table :admins do |t|
      t.string "username", :limit => 30
      t.string "password"
      t.string "first_name", :default => "Unspecified."
      t.string "last_name", :default => "Unspecified."
      t.string "email", :default => "Unspecified."
      t.integer "num_of_tuts", :default => 0

      t.timestamps
    end
    add_index("admins", "username")
    add_index("admins", "email")
  end

  def down
    drop_table(:admins)
  end

end
