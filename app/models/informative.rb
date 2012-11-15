# -*- encoding : utf-8 -*-
class Informative < ActiveRecord::Base
  attr_accessible :title, :content, :published

  validates_presence_of :title

  def slug
    self.title.parameterize
  end
end

