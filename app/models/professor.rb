# -*- encoding : utf-8 -*-
class Professor < ActiveRecord::Base
  has_one :user, dependent: :destroy
  has_one :own_course, class_name: 'Course', foreign_key: 'coordinator_id'
  belongs_to :course

  accepts_nested_attributes_for :user, allow_destroy: true

  attr_accessible :user_attributes, :name, :curriculum, :dropbox_link,
    :delete_photo, :photo

  attr_accessor :delete_photo

  has_attached_file :photo,
    path: ":rails_root/public/system/professors/:id/:attachment/:style/:filename",
    url: "/system/professors/:id/:attachment/:style/:filename",
    styles: {
      small: '150x150>', medium: '400x400>', thumb: '150x115#',
      facebook_share: '200x200#'
    }

  before_validation { self.photo.clear if self.delete_photo == '1' }
  before_validation :add_protocol_to_links

  validates_attachment_content_type :photo, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, message: 'com formato inválido'
  validates_format_of :dropbox_link, allow_blank: true, with: /^(?:(?:https?|ftp|git):\/\/)?(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i
  validates_presence_of :name, :curriculum

  private

  def add_protocol_to_links
    [:dropbox_link].each do |link|
      unless self.send(link).blank?
        self.send(link.to_s+'=', 'http://' + self.send(link)) if self.send(link).match(/^(\w*):\/\//i).nil?
      end
    end
  end
end