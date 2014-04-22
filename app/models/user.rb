class User < ActiveRecord::Base

  has_many :course_enrollments

end
