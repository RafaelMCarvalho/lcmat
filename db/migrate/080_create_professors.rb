# -*- encoding : utf-8 -*-
class CreateProfessors < ActiveRecord::Migration
  def self.up
    create_table :professors do |t|
      t.string :name
      t.text :curriculum
      t.string :dropbox_link
      t.has_attached_file :photo

      t.timestamps
    end
  end

  def self.down
    drop_table :professors
  end
end

