class ProjectNumber < ActiveRecord::Base
  attr_accessible :number
  has_many :projects

end
