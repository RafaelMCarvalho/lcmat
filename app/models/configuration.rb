# -*- encoding : utf-8 -*-
class Configuration < ActiveRecord::Base

	attr_accessible :email, :keywords, :description, :google_analytics, :footer

  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end

