# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'course show' do
  background { FactoryGirl.create :configuration }

  scenario 'informations' do
    course_1 = FactoryGirl.create :course, name: 'Ciência da Computação',
      description: 'Descrição do curso de ciência da computação'
    course_2 = FactoryGirl.create :course, name: 'Licenciatura em Matemática'
    visit root_path
    click_link 'Ciência da Computação'
    page.should have_content 'Descrição do curso de ciência da computação'
  end

  scenario 'redirect to index page' do
    course_1 = FactoryGirl.create :course, name: 'Ciência da Computação'
    visit course_path(course_1)
    click_link 'Página inicial'
    current_path.should == course_path(course_1)
  end

  scenario 'list professors of the course' do
    course_1 = FactoryGirl.create :course
    professor_1 = FactoryGirl.create :professor, name: 'Rivera', course: course_1
    FactoryGirl.create :professor, name: 'Annabell', course: course_1
    FactoryGirl.create :professor, name: 'Coca', course: nil
    visit course_path(course_1)
    within('.subnav') { click_link 'Professores' }
    page.should have_content 'Rivera'
    page.should have_content 'Annabell'
    page.should have_no_content 'Coca'
  end

  context 'list course files' do
    scenario 'when there any file' do
      course = FactoryGirl.create :course
      course_file = FactoryGirl.create :course_file, course: course
      visit course_files_path(course)
      page.should have_content course_file.file.name
    end

    scenario 'when there is no file, show message' do
      course = FactoryGirl.create :course
      visit course_files_path(course)
      page.should have_content 'Não há arquivos.'
    end
  end
end