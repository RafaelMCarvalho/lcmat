require 'spec_helper'

feature 'login and register' do
	background do
		FactoryGirl.create :configuration
	end

	it 'should not be possible guest user register an administrator' do
		visit '/admin'
		page.should_not have_content 'Registrar'

		lambda { visit '/users/sign_up' }.should raise_error ActionController::RoutingError
	end

	it 'edit user information' do
		user = FactoryGirl.create :user
		login(user.email, '123456')
		click_link user.email
		fill_in 'E-mail', :with => 'outro_email@email.com'
		click_button 'Salvar'
		page.should have_content 'Usuário atualizado(a) com sucesso.'
	end
end	