# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'Manipulate course' do
  background do
    @user = FactoryGirl.create :user, :email => 'user@user.com', :password => '123456'
    FactoryGirl.create :configuration
    login(@user.email,'123456')
    @coordinator = FactoryGirl.create :professor
    @professor = FactoryGirl.create :professor
  end

  context 'new' do
    before :each do
      visit '/admin/course/new'
    end

    scenario 'successfully', js: true do
      fill_in 'Nome', :with => 'Novo Nome'
      fill_in 'Descrição', :with => 'Desc'
      select @coordinator.name, :from => 'Coordenador'
      select @professor.name, :from => 'Professores'
      click_link 'Adicionar Arquivo'
      attach_file 'Arquivo', "#{Rails.root}/spec/data/image.jpg"
      click_button 'Salvar'
      page.should have_content 'Curso criado(a) com sucesso.'
    end

    scenario 'failure', js: true do
      fill_in 'Nome', with: ''
      click_link 'Adicionar Arquivo'
      click_button 'Salvar'

      page.should have_content 'Nome não pode ser vazio.'
      page.should have_content 'Coordenador não pode ser vazio.'
      page.should have_content 'Arquivo não pode ser vazio.'
    end
  end
end

