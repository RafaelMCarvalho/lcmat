class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.references :coordinator

      t.timestamps
    end
    add_index :courses, :coordinator_id
  end
end
