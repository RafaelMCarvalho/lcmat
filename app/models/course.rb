class Course < ActiveRecord::Base
  belongs_to :coordinator, class_name: 'Professor'
  has_many :professors
  has_many :course_files

  accepts_nested_attributes_for :course_files, allow_destroy: true

  attr_accessible :description, :name, :coordinator_id, :professor_ids,
    :coordinator, :course_files_attributes

  validates_presence_of :name, :coordinator

  def professors
    if coordinator
      [coordinator] + super
    else
      super
    end
  end
end
