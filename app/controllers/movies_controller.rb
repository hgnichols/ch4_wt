# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def show
    id = params[:id] 
    @movie = Movie.find(id) 
    byebug
    logger.debug("I am a debug message")
    raise params.inspect
  end
  
  def new
  @movie = Movie.new
  # default: render 'new' template
  end 

  # add below all other methods
private

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end