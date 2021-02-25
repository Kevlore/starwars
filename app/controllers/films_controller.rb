class FilmsController < ApplicationController
  def index
    @films = Film.search(params[:search])
  end

  def show
    @film = Film.find(params[:id])
  end

  def film_params
    params.require(:film).permit(:title, :director, :release_date, :search)
  end
end
