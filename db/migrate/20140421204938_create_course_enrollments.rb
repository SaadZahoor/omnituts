class CreateCourseEnrollments < ActiveRecord::Migration

  def up
    create_table :course_enrollments do |t|
      t.references :user
      t.references :course
      t.integer "num_of_courses_prior", :default => 0
      t.timestamps
    end
    add_index("course_enrollments", ["user_id", "course_id"])
  end

  def down
    drop_table(:course_enrollments)
  end

end
