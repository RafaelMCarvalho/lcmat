class Course < ActiveRecord::Base
  belongs_to :coordinator, class_name: 'Professor'
  has_many :professors

  attr_accessible :description, :name, :coordinator_id, :professor_ids

  validates_presence_of :name, :coordinator
end
