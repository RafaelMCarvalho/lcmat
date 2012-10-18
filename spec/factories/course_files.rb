# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_file do
    file File.new("#{Rails.root}/spec/data/file.pdf")
    course nil
  end
end
