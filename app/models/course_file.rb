class CourseFile < ActiveRecord::Base
  belongs_to :course
  # attr_accessible :title, :body
end
