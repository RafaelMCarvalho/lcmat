class CreateCourseFiles < ActiveRecord::Migration
  def change
    create_table :course_files do |t|
      t.references :course
      t.has_attached_file :file

      t.timestamps
    end
    add_index :course_files, :course_id
  end
end
