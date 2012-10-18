class CreateCourseFiles < ActiveRecord::Migration
  def change
    create_table :course_files do |t|
      t.references :course

      t.timestamps
    end
    add_index :course_files, :course_id
  end
end
