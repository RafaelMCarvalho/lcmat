# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'informative index' do
  background { FactoryGirl.create :configuration }

  context 'when there is an informative' do
    scenario 'show the last one' do
      informative_1 = FactoryGirl.create :informative, 
        title: 'Informativo 1', content: 'Descrição do informativo 1'
      informative_2 = FactoryGirl.create :informative,
        title: 'Informativo 2', content: 'Descrição do informativo 2'
      visit root_path
      within('.span7') do
        page.should have_content 'Informativo 2'
        page.should have_content 'Descrição do informativo 2'

        page.should have_no_content 'Informativo 1'
        page.should have_no_content 'Descrição do informativo 1'
      end
    end
  end

  context 'when there is no informative' do
    scenario 'show a welcome text' do
      visit root_path
      within('.span7') do
        page.should have_content 'Bem-vindo ao site do LCMAT'
      end
    end
  end
end