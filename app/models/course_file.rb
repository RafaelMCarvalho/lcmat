class CourseFile < ActiveRecord::Base
  belongs_to :course
  attr_accessible :file

  has_attached_file :file
end
