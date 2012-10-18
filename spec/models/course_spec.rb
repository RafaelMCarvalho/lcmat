require 'spec_helper'

describe Course do
  it 'create a valid course' do
    course = FactoryGirl.create :course
    course.should be_valid
  end

  it 'return professors, including coordinator' do
    coordinator = FactoryGirl.create(:professor)
    professor = FactoryGirl.create(:professor)
    course = FactoryGirl.create(:course,
      coordinator: coordinator, 
      professors: [professor])
    course.professors.should == [coordinator, professor]
  end

  context 'validations' do
    context 'name' do
      it { should_not have_valid(:name).when('', nil) }
      it { should have_valid(:name).when('Algum nome') }
    end
  end

  describe 'relationships' do
    it { should belong_to(:coordinator).class_name(Professor) }
    it { should have_many(:professors) }
    it { should have_many(:course_files) }
  end
end