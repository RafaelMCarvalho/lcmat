# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :ckeditor_file, :class => Ckeditor::AttachmentFile do
    data File.new("#{Rails.root}/spec/data/file.pdf")
  end
end
