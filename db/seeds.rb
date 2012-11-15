# -*- encoding : utf-8 -*-
require 'factory_girl_rails'

professor_description = '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Qui convenit? Restinguet citius, si ardentem acceperit. Si longus, levis; Dat enim intervalla et relaxat. </p>

<blockquote cite="http://loripsum.net">
  Quid, si non modo utilitatem tibi nullam afferet, sed iacturae rei familiaris erunt faciendae, labores suscipiendi, adeundum vitae periculum?
</blockquote>


<ul>
  <li>Dolere malum est: in crucem qui agitur, beatus esse non potest.</li>
  <li>Illis videtur, qui illud non dubitant bonum dicere -;</li>
  <li>Cenasti in vita numquam bene, cum omnia in ista Consumis squilla atque acupensere cum decimano.</li>
</ul>


<p>Duo Reges: constructio interrete. Negare non possum. Tu quidem reddes; Qualem igitur hominem natura inchoavit? Aliter homines, aliter philosophos loqui putas oportere? <a href="http://loripsum.net/" target="_blank">Sed quid sentiat, non videtis.</a> </p>'
course_description = professor_description
home_content = professor_description
contact_content = '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Qui convenit? Restinguet citius, si ardentem acceperit. Si longus, levis; Dat enim intervalla et relaxat. </p>

<blockquote cite="http://loripsum.net">
  Quid, si non modo utilitatem tibi nullam afferet, sed iacturae rei familiaris erunt faciendae, labores suscipiendi, adeundum vitae periculum?
</blockquote>'
informative_content = contact_content

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
  email: 'base@project.com.br',
  footer: 'LCMAT - Laboratório de Ciências Matemáticas da UENF
UENF - P5 - Sala 113
Av. Alberto Lamego, 2000 - Pq. Califórnia
Campos dos Goytacazes - RJ
contato@lcmat.uenf.br | (22) 2739-3333'
)

Page.delete_all
Page.create!(
  title: 'Contato',
  content: contact_content,
  published: true
)
page = Page.last
page.indicator = Page::PAGES[:contact]
page.save

Page.create!(
  title: 'Home',
  content: home_content,
  published: true
)
page = Page.last
page.indicator = Page::PAGES[:home]
page.save

Professor.delete_all
annabell = Professor.new(name: 'Annabell Del Real Tamariz', curriculum: professor_description,
  linkedin: 'http://google.com',
  dropbox: 'http://google.com',
  lattes: 'http://google.com',
  photo: File.new("#{Rails.root}/db/seeds_data/annabell.jpg"))
annabell.user = annabell_user
annabell.save

rivera = Professor.new(name: 'Luis Antonio Rivera Escriba', curriculum: professor_description,
  linkedin: 'http://google.com',
  lattes: 'http://google.com')
rivera.user = rivera_user
rivera.save

5.times do
  FactoryGirl.create(:professor, name: 'Lorem ipsum dolor sit amet', curriculum: professor_description,
    linkedin: 'http://google.com',
    dropbox: 'http://google.com',
    lattes: 'http://google.com')
end

5.times do
  FactoryGirl.create(:professor, name: 'Lorem ipsum dolor sit amet', curriculum: professor_description,
    linkedin: 'http://google.com',
    lattes: 'http://google.com')
end

5.times do
  FactoryGirl.create(:professor, name: 'Lorem ipsum dolor sit amet', curriculum: professor_description,
    linkedin: 'http://google.com',
    dropbox: 'http://google.com')
end

Course.delete_all
math = Course.create!(name: 'Licenciatura em Matemática',
  description: course_description,
  coordinator: Professor.all[5])
computer = Course.create!(name: 'Ciência da Computação',
  description: course_description,
  coordinator: annabell)
materials = Course.create!(name: 'Engenharia de Materiais',
  description: course_description,
  coordinator: Professor.all[6])
civil = Course.create!(name: 'Engenharia Civil',
  description: course_description,
  coordinator: Professor.all[7])
production = Course.create!(name: 'Engenharia de Produção',
  description: course_description,
  coordinator: Professor.all[8])

rivera.update_attribute(:course, computer)

CourseFile.delete_all
10.times do
  course_file = CourseFile.create!(file: File.open("#{Rails.root}/spec/data/file.pdf"))
  course_file.update_attribute(:course, computer)
end

Informative.delete_all

7.times do |i|
  Informative.create!(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit ' + i.to_s,
    content: informative_content)
end

3.times do |i|
  Informative.create!(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit ' + (i+7).to_s,
    content: '')
end