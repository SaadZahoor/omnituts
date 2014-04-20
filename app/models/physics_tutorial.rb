class PhysicsTutorial < ActiveRecord::Base

  scope :published, lambda { where(:published => true) }
  scope :sorted, lambda { order("physics_tutorials.id ASC") }
  scope :newest_first, lambda { order("physics_tutorials.created_at ASC") }

end
