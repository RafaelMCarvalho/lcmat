class InformativesController < ApplicationController
  def index
    @informatives = Informative.all    
  end
end