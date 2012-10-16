# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :professor, aliases: [:coordinator] do
    name 'Professor Name'
    curriculum 'Professor curriculum'
    user
  end
end
