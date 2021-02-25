class SpeciesController < ApplicationController
  def index
      @species = Species.search(params[:search])
  end

  def show
    @specy = Species.find(params[:id])
  end

  def species_params
    params.require(:specy).permit(:name, :classification, :average_height, :average_lifespan, :skin_colors, :language, :search)
  end
end
