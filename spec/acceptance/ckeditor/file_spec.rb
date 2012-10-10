# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'upload files' do
	background do
    @user = FactoryGirl.create :user, :email => 'user@user.com', :password => '123456'
    @configuration = FactoryGirl.create :configuration
    login(@user.email,'123456')
	end

	context 'add a file' do
		it 'successfully' do
    	click_link 'Arquivos'
			click_link 'Adicionar'
			attach_file 'Arquivo', "#{Rails.root}/spec/data/file.pdf"
			click_button 'Salvar'
			page.should have_content 'Arquivo criado(a) com sucesso.'
		end

		it 'with errors' do
    	click_link 'Arquivos'
			click_link 'Adicionar'
			click_button 'Salvar'
			page.should have_content 'Arquivo criado(a) com falha.'
		end
	end

	it 'remove a file' do
		file = FactoryGirl.create :ckeditor_file
  	click_link 'Arquivos'
		find("a[@href='/admin/ckeditor~attachment_file/#{file.id}/delete']").click
		click_button 'Sim, eu tenho certeza.'
		page.should have_content 'Arquivo excluído(a) com sucesso.'
	end
end