# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'upload images' do
	background do
    @user = FactoryGirl.create :user, :email => 'user@user.com', :password => '123456'
    @configuration = FactoryGirl.create :configuration
    login(@user.email,'123456')
	end

	context 'add an image' do
		it 'successfully' do
    	click_link 'Imagens'
			click_link 'Adicionar'
			attach_file 'Imagem', "#{Rails.root}/spec/data/image.jpg"
			click_button 'Salvar'
			page.should have_content 'Imagem criado(a) com sucesso.'
		end

		it 'with errors' do
    	click_link 'Imagens'
			click_link 'Adicionar'
			click_button 'Salvar'
			page.should have_content 'Imagem criado(a) com falha.'
		end
	end

	it 'remove an image' do
		image = FactoryGirl.create :ckeditor_image
  	click_link 'Imagens'
		find("a[@href='/admin/ckeditor~picture/#{image.id}/delete']").click
		click_button 'Sim, eu tenho certeza.'
		page.should have_content 'Imagem excluído(a) com sucesso.'
	end
end