class Tutorial < ActiveRecord::Base
  # Associations
  belongs_to :course
  belongs_to :admin

  # Validations
  validates_presence_of :tut_title
  validates_uniqueness_of :tut_title
  validates_length_of :tut_title, :minimum => 3
  validates_presence_of :course_id

end
