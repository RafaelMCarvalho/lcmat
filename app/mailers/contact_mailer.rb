# -*- encoding : utf-8 -*-
class ContactMailer < ActionMailer::Base
  default :from => 'lcmat@email.com'

  def contact(params={})
    configuration = ::Configuration.first
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    mail(:to => configuration.email,
         :subject => "[Contato] #{params[:name]}",
         :content_type => "text/plain")
  end
end

