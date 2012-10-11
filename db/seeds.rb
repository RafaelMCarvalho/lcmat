# -*- encoding : utf-8 -*-
User.delete_all
User.create!(
  :email => 'admin@base.com',
  :password => '123456',
  :password_confirmation => '123456'
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
Course.create!(name: 'Licenciatura em Matemática',
  description: 'Licenciatura em Matemática')
Course.create!(name: 'Ciência da Computação',
  description: 'Ciência da Computação')
Course.create!(name: 'Engenharia de Materiais',
  description: 'Engenharia de Materiais')
Course.create!(name: 'Engenharia Civil',
  description: 'Engenharia Civil')
Course.create!(name: 'Engenharia de Produção',
  description: 'Engenharia de Produção')

Informative.delete_all
Informative.create!(
  title: 'Informativo 1',
  content: 'Conteúdo do informativo')
