class CharactersController < ApplicationController
  def index
    # @characters = Character.all.order("name")
    @characters = Character.search(params[:search])
  end

  def show
    @character = Character.find(params[:id])
  end

  def characters_params
    params.require(:character).permit(:name, :birth_year, :gender, :hair_color, :height, :quote, :search)
  end
end
