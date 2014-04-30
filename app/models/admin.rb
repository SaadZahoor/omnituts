class Admin < ActiveRecord::Base

  has_secure_password

  has_many :tutorials
  
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  
  validates :username, :presence => true,
                       :length => { :maximum => 30 },
                       :uniqueness => true
  validates :email, :presence => true,
                    :length => { :minimum => 6 },
                    :format => EMAIL_REGEX,
                    :confirmation => true

end
