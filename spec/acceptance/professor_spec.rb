# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'Manipulate professor' do
  background do
    @user = FactoryGirl.create :user, :email => 'user@user.com', :password => '123456'
    FactoryGirl.create :configuration
    login(@user.email,'123456')
  end

  context 'new' do
    before :each do
      visit '/admin/professor/new'
    end

    scenario 'successfully' do
      fill_in 'Nome', :with => 'Novo Nome'
      fill_in 'Currículo', :with => 'Currículo'
      fill_in 'Link do Dropbox', :with => 'foo.com'
      fill_in 'E-mail', :with => 'professor@uenf.lcmat.br'
      fill_in 'Senha', :with => '123456'
      fill_in 'Confirme a senha', :with => '123456'
      click_button 'Salvar'
      page.should have_content 'Professor criado(a) com sucesso.'
    end

    scenario 'failure' do
      fill_in 'Nome', :with => ''
      fill_in 'Currículo', :with => ''
      fill_in 'Link do Dropbox', :with => 'foo'
      click_button 'Salvar'
      page.should have_content 'Nome não pode ser vazio.'
      page.should have_content 'Currículo não pode ser vazio.'
      page.should have_content 'Link do Dropbox não é válido.'
    end
  end

  context 'edit' do
    before :each do
      professor = FactoryGirl.create :professor
      visit "/admin/professor/#{professor.id}/edit"
    end

    scenario 'successfully' do
      fill_in 'Nome', :with => 'Novo Nome'
      fill_in 'Currículo', :with => 'Algum currículo'
      fill_in 'Link do Dropbox', :with => 'foo.com'
      click_button 'Salvar'
      page.should have_content 'Professor atualizado(a) com sucesso.'
    end

    scenario 'failure' do
      fill_in 'Nome', :with => ''
      fill_in 'Currículo', :with => ''
      fill_in 'Link do Dropbox', :with => 'foo'
      click_button 'Salvar'
      page.should have_content 'Nome não pode ser vazio.'
      page.should have_content 'Currículo não pode ser vazio.'
      page.should have_content 'Link do Dropbox não é válido.'
    end
  end
end

