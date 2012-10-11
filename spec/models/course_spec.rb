require 'spec_helper'

describe Course do
  it 'create a valid course' do
    course = FactoryGirl.create :course
    course.should be_valid
  end
end