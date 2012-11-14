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
      attach_file 'Foto', "#{Rails.root}/spec/data/image.jpg"
      fill_in 'Currículo', :with => 'Currículo'
      fill_in 'Dropbox', :with => 'foo.com'
      fill_in 'LinkedIn', :with => 'foo.com'
      fill_in 'Lattes', :with => 'foo.com'
      fill_in 'E-mail', :with => 'professor@uenf.lcmat.br'
      fill_in 'Senha', :with => '123456'
      fill_in 'Confirme a senha', :with => '123456'
      click_button 'Salvar'
      page.should have_content 'Professor criado(a) com sucesso.'
    end

    scenario 'failure' do
      fill_in 'Nome', with: ''
      attach_file 'Foto', "#{Rails.root}/spec/data/file.pdf"
      fill_in 'Currículo', with: ''
      fill_in 'Dropbox', with: 'foo'
      fill_in 'LinkedIn', with: 'foo'
      fill_in 'Lattes', with: 'foo'
      fill_in 'E-mail', :with => 'professor'
      fill_in 'Senha', :with => '123456'
      fill_in 'Confirme a senha', :with => ''

      click_button 'Salvar'
      page.should have_content 'Nome não pode ser vazio.'
      page.should have_content 'Currículo não pode ser vazio.'
      page.should have_content 'Dropbox não é válido.'
      page.should have_content 'LinkedIn não é válido.'
      page.should have_content 'Lattes não é válido.'
      page.should have_content 'Foto com formato inválido'
      page.should have_content 'Confirme a senha não pode ser vazio.'
      page.should have_content 'E-mail não é válido.'
    end
  end
end

