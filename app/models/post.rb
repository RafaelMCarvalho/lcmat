# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  attr_accessible :title, :content, :published

  validates_presence_of :title
end

