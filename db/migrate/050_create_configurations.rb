# -*- encoding : utf-8 -*-
class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.string :email
      t.string :keywords
      t.text :description
      t.text :google_analytics

      t.timestamps
    end
  end

  def self.down
    drop_table :configurations
  end
end

