class Course < ActiveRecord::Base

  has_many :tutorials
  has_many :course_enrollments

end
