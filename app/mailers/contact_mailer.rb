# -*- encoding : utf-8 -*-
class ContactMailer < ActionMailer::Base
  def contact(params={})
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    @to = params[:to]
    mail(:from => @email,
         :to => @to,
         :subject => "[Contato] #{params[:name]}",
         :content_type => "text/plain")
  end
end

