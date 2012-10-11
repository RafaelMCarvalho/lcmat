# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'Manipulate informatives' do
  background do
    @user = FactoryGirl.create :user, :email => 'user@user.com', :password => '123456'
    FactoryGirl.create :configuration
    login(@user.email,'123456')
  end

  context 'new' do
    before :each do
      visit '/admin/informative/new'
    end

    scenario 'successfully' do
      fill_in 'Título', :with => 'Novo título'
      fill_in 'Conteúdo', :with => ''
      check 'Publicado'
      click_button 'Salvar'
      page.should have_content 'Informativo criado(a) com sucesso.'
    end

    scenario 'failure' do
      fill_in 'Título', :with => ''
      click_button 'Salvar'
      page.should have_content 'Título não pode ser vazio.'
    end
  end

  context 'edit' do
    before :each do
      informative = FactoryGirl.create :informative
      visit "/admin/informative/#{informative.id}/edit"
    end

    scenario 'successfully' do
      fill_in 'Título', :with => 'Novo título'
      fill_in 'Conteúdo', :with => ''
      check 'Publicado'
      click_button 'Salvar'
      page.should have_content 'Informativo atualizado(a) com sucesso.'
    end

    scenario 'failure' do
      fill_in 'Título', :with => ''
      click_button 'Salvar'
      page.should have_content 'Título não pode ser vazio.'
    end
  end
end

