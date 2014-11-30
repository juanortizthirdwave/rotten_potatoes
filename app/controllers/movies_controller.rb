class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.rating
    session[:order] = params[:order]
    @order = session[:order]
    @rating_hash = { rating: session[:ratings] } unless params[:ratings]


    # debugger

    if params[:ratings]
      session.clear
      session[:ratings] = params[:ratings].keys
      @rating_hash = { rating: session[:ratings] }
      @movies = Movie.where(@rating_hash).order(session[:order])
    elsif session[:ratings]
      @movies = Movie.where(rating: session[:ratings]).order(session[:order])
    else
      @movies = Movie.order(session[:order])
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
