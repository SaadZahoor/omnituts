class CreateTutorials < ActiveRecord::Migration

  def up
    create_table :tutorials do |t|
      t.integer "course_id", :null => false
      t.string "tut_title", :default => "Tutorial title", :null => false
      t.string "tut_content", :default => "Lots to learn about!", :null => false
      t.string "num_of_admins", :default => 1, :null => false
      t.timestamps
    end
    add_index("tutorials", "course_id")
    add_index("tutorials", "tut_title")
  end

  def down
    drop_table(:tutorials)
  end

end
