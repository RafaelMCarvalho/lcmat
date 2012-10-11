# -*- encoding : utf-8 -*-
class CreateProfessors < ActiveRecord::Migration
  def self.up
    create_table :professors do |t|
      t.string :name
      t.text :curriculum
      t.string :dropbox
      t.string :lattes
      t.string :linkedin
      t.has_attached_file :photo
      t.references :course

      t.timestamps
    end
  end

  def self.down
    drop_table :professors
  end
end

