class HomeController < ApplicationController
  def index
    @films = Film.includes(:characters).order("release_date")
    @characters = Character.all.order("name")
    @species = Species.all.order("name")
  end
end
