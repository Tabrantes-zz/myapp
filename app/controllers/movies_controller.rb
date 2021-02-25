class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
    puts @movie
  end

  def create
    @user = current_user
    puts @user
    @movie = @user.movies.create(params_requre)
    redirect_to movies_path

    #@movie = @user.movies.new(params_requre)
    # if movie.save
  end

  def edit
  end

  def update
    puts "77777777777777777777"
    @movie.update(params_requre)
    redirect_to movies_path
  end

  def destroy
  end

  def set_movie
    @movie = Movie.find(params[:id])
    puts @movie
  end

  protected

  def params_requre
    params.require(:movie).permit(:title, :description)
  end
end
