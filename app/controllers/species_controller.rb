class SpeciesController < ApplicationController
  def index
    @species = Species.all
  end

  def show
    @specy = Species.find(params[:id])
  end
end
