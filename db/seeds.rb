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
math = Course.create!(name: 'Licenciatura em Matemática',
  description: 'Licenciatura em Matemática')
computer = Course.create!(name: 'Ciência da Computação',
  description: 'Ciência da Computação')
materials = Course.create!(name: 'Engenharia de Materiais',
  description: 'Engenharia de Materiais')
civil = Course.create!(name: 'Engenharia Civil',
  description: 'Engenharia Civil')
production = Course.create!(name: 'Engenharia de Produção',
  description: 'Engenharia de Produção')


Professor.delete_all
rivera = Professor.create!(name: 'Rivera', 
  curriculum: 'Meu curriculo')
annabell = Professor.create!(name: 'Annabell',
  curriculum: 'Meu curriculo')
rivera.update_attribute(:course, computer)
annabell.update_attribute(:course, computer)
computer.update_attribute(:coordinator, annabell)

Informative.delete_all
Informative.create!(
  title: 'Informativo 1',
  content: 'Conteúdo do informativo')
