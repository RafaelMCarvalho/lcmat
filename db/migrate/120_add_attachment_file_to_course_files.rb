class AddAttachmentFileToCourseFiles < ActiveRecord::Migration
  def self.up
    change_table :course_files do |t|
      t.has_attached_file :file
    end
  end

  def self.down
    drop_attached_file :course_files, :file
  end
end
