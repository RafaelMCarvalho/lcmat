class InformativesController < ApplicationController
  def index
    @informatives = Informative.where('published = ?', true).order('updated_at DESC')
  end
end