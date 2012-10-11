# -*- encoding : utf-8 -*-
class Link < ActiveRecord::Base
  belongs_to :professor

  attr_accessible :title, :url, :professor

  before_validation :add_protocol_to_url

  validates_format_of :url, allow_blank: true, with: /^(?:(?:https?|ftp|git):\/\/)?(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i
  validates_presence_of :title, :url

  private

  def add_protocol_to_url
    unless self.url.nil?
      self.url = 'http://' + self.url if self.url.match(/^(\w*):\/\//i).nil?
    end
  end
end
