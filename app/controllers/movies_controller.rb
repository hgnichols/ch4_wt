# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def show
    id = params[:id] 
    @movie = Movie.find(id) 
    byebug
    #logger.debug("I am a debug message")
    #raise params.inspect
  end
  
  def new
    @movie = Movie.new
    # default: render 'new' template
  end 
  
  # in movies_controller.rb
  def create
    #@movie = Movie.create!(params[:movie]) #old way
    @movie = Movie.create!(movie_params)  # new way
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  # add below all other methods
private

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end