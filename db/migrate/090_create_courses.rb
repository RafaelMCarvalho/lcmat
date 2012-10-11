class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.references :professor

      t.timestamps
    end
    add_index :courses, :professor_id
  end
end
