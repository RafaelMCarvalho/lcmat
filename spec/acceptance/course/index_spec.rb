# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'course index' do
  scenario 'shoud list the courses' do
    course_1 = FactoryGirl.create :course, name: 'Ciência da Computação'
    course_2 = FactoryGirl.create :course, name: 'Licenciatura em Matemática'
    visit root_path
    click_link 'Cursos'
    page.should have_content 'Ciência da Computação'
    page.should have_content 'Licenciatura em Matemática'
  end
end