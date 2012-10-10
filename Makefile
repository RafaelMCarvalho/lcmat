specs:
	@echo ""
	@echo "======================"
	@echo "Rodando todas as specs"
	@echo "======================"
	@echo ""
	@rspec spec --format progress

install:
	@echo ""
	@echo "=================================="
	@echo "Instalando dependencias do sistema"
	@echo "=================================="
	@echo ""libmagickwand-dev
	@sudo apt-get install imagemagick libmagickcore-dev libmagickwand-dev


banco:
	@echo "================================"
	@echo "Recriando banco de dados do zero"
	@echo "================================"
	@sed -i s/^/\#/ config/initializers/rails_admin.rb
	@rake db:drop:all
	@rake db:create:all
	@rake db:migrate
	@sed -i '1 i \# -*- encoding : utf-8 -*-' db/schema.rb
	@rake db:test:prepare
	@rake db:seed
	@sed -i s/^\#// config/initializers/rails_admin.rb

