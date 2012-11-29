class InformativesController < ApplicationController
  def index
    @informatives = Informative.where('published = ?', true).order('updated_at DESC').page(params[:page]).per(10)
  end

  def show
    @informative = Informative.find(params[:id])
  end
end