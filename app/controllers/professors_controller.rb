class ProfessorsController < ApplicationController

  def show
    @professor = Professor.find(params[:id])
  end
end