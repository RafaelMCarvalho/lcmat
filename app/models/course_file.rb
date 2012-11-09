class CourseFile < ActiveRecord::Base
  belongs_to :course
  has_attached_file :file,
    path: ":rails_root/public/system/course_files/:id/:filename",
    url: "/system/course_files/:id/:filename",
    styles: { }

  attr_accessible :file
  attr_accessor :delete_photo

  before_validation { self.photo.clear if self.delete_photo == '1' }

  validates_attachment_presence :file

  def name
    self.file_file_name
  end

  def file_url
    'oi'
  end
end
