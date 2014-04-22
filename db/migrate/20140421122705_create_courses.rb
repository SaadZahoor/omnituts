class CreateCourses < ActiveRecord::Migration

  def up
    create_table :courses do |t|
      t.string "course_name", :default => "New Course", :null => false
      t.string "course_description", :default => "An exciting description about an exciting new course!"
      t.integer "num_of_tuts", :default => 0
      t.integer "num_of_enrollments", :default => 0
      t.timestamps
    end
    add_index("courses", "course_name")
    add_index("courses", "course_description")
  end

  def down
    drop_table(:courses)
  end
  
end
