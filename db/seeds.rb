# -*- encoding : utf-8 -*-

lorem_description = '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praeclare hoc quidem. Dat enim intervalla et relaxat. Graece donan, Latine voluptatem vocant. <a href="http://loripsum.net/" target="_blank">Sed ad rem redeamus;</a> </p>

<p>Sed fortuna fortis; Quid iudicant sensus? Memini vero, inquam; Obsecro, inquit, Torquate, haec dicit Epicurus? </p>

<ul>
  <li>-, sed ut hoc iudicaremus, non esse in iis partem maximam positam beate aut secus vivendi.</li>
  <li>Ne tum quidem te respicies et cogitabis sibi quemque natum esse et suis voluptatibus?</li>
  <li>Partim cursu et peragratione laetantur, congregatione aliae coetum quodam modo civitatis imitantur;</li>
  <li>Illa argumenta propria videamus, cur omnia sint paria peccata.</li>
</ul>


<p>Duo Reges: constructio interrete. Nos commodius agimus. Sed ea mala virtuti magnitudine obruebantur. Nos commodius agimus. Sed fortuna fortis; Nos cum te, M. </p>

<p>Respondeat totidem verbis. Quae est igitur causa istarum angustiarum? <a href="http://loripsum.net/" target="_blank">Sedulo, inquam, faciam.</a> Tollenda est atque extrahenda radicitus. </p>

<blockquote cite="http://loripsum.net">
  Sunt etiam turpitudines plurimae, quae, nisi honestas natura plurimum valeat, cur non cadant in sapientem non est facile defendere.
</blockquote>


<p>Quorum altera prosunt, nocent altera. <a href="http://loripsum.net/" target="_blank">Quod vestri non item.</a> Quae duo sunt, unum facit. Quae diligentissime contra Aristonem dicuntur a Chryippo. Facillimum id quidem est, inquam. Haec dicuntur inconstantissime. Restinguet citius, si ardentem acceperit. Tum Torquatus: Prorsus, inquit, assentior; </p>'

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
  description: lorem_description,
  coordinator: annabell)
computer = Course.create!(name: 'Ciência da Computação',
  description: lorem_description,
  coordinator: annabell)
materials = Course.create!(name: 'Engenharia de Materiais',
  description: lorem_description,
  coordinator: annabell)
civil = Course.create!(name: 'Engenharia Civil',
  description: lorem_description,
  coordinator: annabell)
production = Course.create!(name: 'Engenharia de Produção',
  description: lorem_description,
  coordinator: annabell)

rivera.update_attribute(:course, computer)

CourseFile.delete_all
course_file = CourseFile.create!(file: File.open("#{Rails.root}/spec/data/file.pdf"))
course_file.update_attribute(:course, computer)

Informative.delete_all
Informative.create!(
  title: 'Informativo 1',
  content: 'Conteúdo do informativo')
