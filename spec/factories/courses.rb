# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    name "MyString"
    description "MyText"
    coordinator nil
  end
end
