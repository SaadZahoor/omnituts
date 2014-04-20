class BiologyTutorial < ActiveRecord::Base

  scope :published, lambda { where(:published => true) }
  scope :sorted, lambda { order("biology_tutorials.id ASC") }
  scope :newest_first, lambda { order("biology_tutorials.created_at ASC") }

end
