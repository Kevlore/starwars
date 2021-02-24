class SpeciesController < ApplicationController
  def index
    @species = Species.all.order("name")
  end

  def show
    @specy = Species.find(params[:id])
  end
end
