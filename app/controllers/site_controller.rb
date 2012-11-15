# -*- encoding : utf-8 -*-
class SiteController < ApplicationController

  def index
    @informatives = Informative.where('published = ?', true).order('updated_at DESC').limit(6)
    @home = Page.where('indicator = ?', Page::PAGES[:home]).first
  end

  # CONTACT BEGIN

  def contact
    @contact = Page.where('indicator = ?', Page::PAGES[:contact]).first
    @contact_form = Contact.new

    raise ActionController::RoutingError unless @contact.published
  end

  def send_contact
    @contact = Page.where('indicator = ?', Page::PAGES[:contact]).first
    @contact_form = Contact.new(params[:contact])

    if @contact_form.save
      redirect_to(contact_path, :notice => "Mensagem enviada com sucesso.")
    else
      render :action => :contact
    end
  end

  # CONTACT END
end

