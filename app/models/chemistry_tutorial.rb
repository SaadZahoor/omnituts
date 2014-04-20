class ChemistryTutorial < ActiveRecord::Base

  scope :published, lambda { where(:published => true) }
  scope :sorted, lambda { order("chemistry_tutorials.id ASC") }
  scope :newest_first, lambda { order("chemistry_tutorials.created_at ASC") }

end
