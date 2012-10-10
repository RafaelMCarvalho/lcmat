# -*- encoding : utf-8 -*-

RailsAdmin.config do |config|

  config.main_app_name = ["Lcmat", "Administração"]

  config.current_user_method { current_user } #auto-generated

  config.authorize_with :cancan

  # CKeditor models (begin)
  config.model Ckeditor::Asset do
    visible false
  end

 config.model Ckeditor::Picture do
   label "Imagem"
   label_plural "Imagens"
   navigation_label 'Arquivos adicionados através do editor'
   weight 1

   edit do
     field(:data) { label 'Imagem' }
   end

   list do
     field(:data) { label 'Imagem' }
     field(:created_at) { label 'Criado em' }
     field(:updated_at) { label 'Atualizado em' }
   end
 end

 config.model Ckeditor::AttachmentFile do
   label 'Arquivo'
   navigation_label 'Arquivos adicionados através do editor'
   weight 1

   edit do
     field(:data) { label 'Arquivo' }
   end

   list do
     field(:data) do
       label 'Arquivo'
        pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
         "<a href='#{value.url}' target='_blank'>#{value.original_filename}</a>".html_safe
       end
     end

     field(:created_at) { label 'Criado em' }
     field(:updated_at) { label 'Atualizado em' }
   end
 end
 # CKeditor models (end)

  config.model Configuration do

    edit do
      group :email do
        label 'Configurações de email'
        field :email
      end

      group :info_search do
        label 'Informações para buscadores'

        field :keywords do
           help 'Separadas por vírgula. Recomendável no máximo 10 palavras chave.'
        end
        field :description do
          help 'Descrição utilizada pelos buscadores. Recomendável até 160 caracteres.'
        end

        field :google_analytics
      end
    end
 end

  config.model Page do
    list do
      field :title
      field :published
    end

    edit do
      field :title
      field(:content) { ckeditor true }
      field :published
    end
  end

  config.model Post do
    list do
      field :title
      field :published
    end

    edit do
      field :title
      field(:content) { ckeditor true }
      field :published
    end
  end


  config.model Professor do
    list do
      field :photo
      field :name
      field :user do
        label 'E-mail'
      end
    end

    edit do
      field :name
      field :photo
      field :curriculum do
        bootstrap_wysihtml5 true
      end
      field :dropbox_link do
        hint 'Conheça o <a href="http://dropbox.com">Dropbox</a> e compartilhe arquivos com seus alunos.'.html_safe
      end
      field :user do
        help 'Pressione o botão para alterar'
      end
    end
  end


  config.model User do
    object_label_method { :email }

    list do
      field :email
    end

    create do
      field :email
      field(:password) do
        label 'Senha'
        help 'Digite a senha do novo usuário'
      end

      field :password_confirmation do
        label 'Confirme a senha'
        help 'Confirme a senha do novo usuário'
      end
    end

    edit do
      field :email
      field(:password) do
        label 'Senha'
        help 'Digite uma nova senha caso deseje modificar a atual'
      end

      field :password_confirmation do
        label 'Confirme a senha'
        help 'Confirme a senha caso deseje mudar a senha atual'
      end
    end
  end
end

