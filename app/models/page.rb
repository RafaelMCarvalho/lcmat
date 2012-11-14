# -*- encoding : utf-8 -*-
class Page < ActiveRecord::Base

	attr_accessible :title, :content, :published

  validates_presence_of :title

  PAGES = {
    :home => 1,
    :contact => 2
  }
end

