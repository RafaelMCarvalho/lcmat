# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :ckeditor_image, :class => Ckeditor::Picture do
    data File.new("#{Rails.root}/spec/data/image.jpg")
  end
end
