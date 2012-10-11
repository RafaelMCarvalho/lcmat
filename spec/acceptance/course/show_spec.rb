# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'course index' do
  background { FactoryGirl.create :configuration }

  scenario 'shoud list the courses' do
    course_1 = FactoryGirl.create :course, name: 'Ciência da Computação',
      description: 'Descrição do curso de ciência da computação'
    course_2 = FactoryGirl.create :course, name: 'Licenciatura em Matemática'
    visit root_path
    click_link 'Ciência da Computação'
    page.should have_content 'Descrição do curso de ciência da computação'
  end
end