# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'Manipulate page' do
  background do
    @user = FactoryGirl.create :user, :email => 'user@user.com', :password => '123456'
    FactoryGirl.create :configuration
    login(@user.email,'123456')
  end

  scenario 'access denied when try to create a new page' do
    lambda {
      visit '/admin/page/new'
    }.should raise_error CanCan::AccessDenied
  end

  context 'edit' do
    before :each do
      page = FactoryGirl.create :page
      visit "/admin/page/#{page.id}/edit"
    end

    scenario 'successfully' do
      fill_in 'Título', :with => 'Novo título'
      fill_in 'Conteúdo', :with => ''
      check 'Publicado'
      click_button 'Salvar'
      page.should have_content 'Página atualizado(a) com sucesso.'
    end

    scenario 'failure' do
      fill_in 'Título', :with => ''
      click_button 'Salvar'
      page.should have_content 'Título não pode ser vazio.'
    end
  end
end

