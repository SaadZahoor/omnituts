class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|
      t.string "username", :null => false, :limit => 30
      t.string "password", :null => false, :limit => 45
      t.string "first_name", :null => false, :limit => 30
      t.string "last_name", :null => false, :limit => 30
      t.string "email", :null => false, :default => "example@example.com"
      t.integer "num_of_courses", :null => false, :default => 0
      t.timestamps
    end
  end

  def down
    drop_table(:users)
  end

end
