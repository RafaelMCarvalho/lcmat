# -*- encoding : utf-8 -*-
User.delete_all
User.create!(
  email: 'admin@base.com',
  password: '123456',
  password_confirmation: '123456'
)
user = User.last
user.admin = true
user.save

rivera_user = User.create!(
  email: 'rivera@uenf.com',
  password: '123456',
  password_confirmation: '123456'
)

annabell_user = User.create!(
  email: 'annabell@uenf.com',
  password: '123456',
  password_confirmation: '123456'
)

Configuration.delete_all
Configuration.create!(
  email: 'base@project.com.br'
)

Page.delete_all
Page.create!(
  title: 'Contato',
  content: 'Conteúdo da página de contato',
  published: true
)
page = Page.last
page.indicator = Page::PAGES[:contact]
page.save

Professor.delete_all
annabell = Professor.new(name: 'Annabell', curriculum: 'Meu curriculo',
  photo: File.new("#{Rails.root}/db/seeds_data/annabell.jpg"))
annabell.user = annabell_user
annabell.save

rivera = Professor.new(name: 'Rivera', curriculum: 'Meu curriculo')
rivera.user = rivera_user
rivera.save

Course.delete_all
math = Course.create!(name: 'Licenciatura em Matemática',
  description: 'Licenciatura em Matemática',
  coordinator: annabell)
computer = Course.create!(name: 'Ciência da Computação',
  description: 'Ciência da Computação',
  coordinator: annabell)
materials = Course.create!(name: 'Engenharia de Materiais',
  description: 'Engenharia de Materiais',
  coordinator: annabell)
civil = Course.create!(name: 'Engenharia Civil',
  description: 'Engenharia Civil',
  coordinator: annabell)
production = Course.create!(name: 'Engenharia de Produção',
  description: 'Engenharia de Produção',
  coordinator: annabell)

rivera.update_attribute(:course, computer)

CourseFile.delete_all
course_file = CourseFile.create!(file: File.open("#{Rails.root}/spec/data/file.pdf"))
course_file.update_attribute(:course, computer)

Informative.delete_all
Informative.create!(
  title: 'Informativo 1',
  content: 'Conteúdo do informativo')
