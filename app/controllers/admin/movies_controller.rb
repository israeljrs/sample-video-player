class Admin::MoviesController < ApplicationController
  load_and_authorize_resource
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @movies = Movie.where(user_id: current_user).all.paginate( page: params[:page], per_page: 25)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save!
      flash[:success] = "Video incluido com sucesso !!!"
      redirect_to admin_movie_path(@movie)
    else
      flash.now[:danger] = "Falha na inclusão do Filme !!!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      flash[:success] = "Filme atualizado com sucesso !!!"
      redirect_to admin_movie_path(@movie)
    else
      flash.now[:danger] = "Falha na atualização do movie"
      render :edit
    end
  end

  def destroy
    if @movie.destroy
      flash[:success] = "Filme excluido com sucesso !!"
      redirect_to admin_movies_path
    else
      flash.now[:danger] = "Falha na exclusão do Filme !!!"
      render :index
    end
  end

  def search
    name = params[:search]
    @movies = Movie.where("lower(title) like lower(?)", "%#{name}%").paginate(page: params[:page], per_page: 25)
    @movies_total = @movies.count
    @search = params[:search]
    render :index
  end

  private
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :url, :image, :published)
    end
end
