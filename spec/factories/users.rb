# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    password "123456"
    password_confirmation "123456"
  end
end
