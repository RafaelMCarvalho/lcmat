# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'Send a contact message' do
  background do
    FactoryGirl.create :configuration
  end

  scenario 'successfully' do
    FactoryGirl.create :page, :indicator => Page::PAGES[:contact]
    visit contact_path
    fill_in 'Nome', :with => 'Fulano'
    fill_in 'E-mail', :with => 'fulano@gmail.com'
    fill_in 'Mensagem', :with => 'Mensagem qualquer'
    click_button 'Enviar mensagem'
    page.should have_content 'Mensagem enviada com sucesso.'
  end

  scenario 'failure' do
    FactoryGirl.create :page, :indicator => Page::PAGES[:contact]
    visit contact_path
    fill_in 'Nome', :with => ''
    fill_in 'E-mail', :with => 'fulano@gmail'
    fill_in 'Mensagem', :with => ''
    click_button 'Enviar mensagem'
    within('.field_with_errors[1]') do
      page.should have_content 'não pode ser vazio.'
    end
    within('.field_with_errors[2]') do
      page.should have_content 'formato inválido.'
    end
    within('.field_with_errors[3]') do
      page.should have_content 'não pode ser vazio.'
    end
  end
end

