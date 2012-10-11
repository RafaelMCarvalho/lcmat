# -*- encoding : utf-8 -*-
User.delete_all
User.create!(
  :email => 'admin@base.com',
  :password => '123456'
)

Configuration.delete_all
Configuration.create!(
  :email => 'base@project.com.br'
)

Page.delete_all
Page.create!(
  :indicator => Page::PAGES[:contact],
  :title => 'Contato',
  :content => 'Conteúdo da página de contato',
  :published => true
)

Course.delete_all
Course.create!(
  name: 'Ciência da Computação',
  description: 'Ciência da Computação')
