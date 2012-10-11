class Course < ActiveRecord::Base
  belongs_to :professor
  attr_accessible :description, :name
end
