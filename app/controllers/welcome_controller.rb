class WelcomeController < ApplicationController
  def index
    @movies = Movie.where(published: true).all.paginate( page: params[:page], per_page: 25)
  end

  def views
    logger.info params
    @movie = MovieView.new
    @movie.movie_id = params[:movie_id]
    @movie.browser = request.headers["User-Agent"]
    if @movie.save!
      @msg = { :status => true, :total => @movie.movie.movie_views.count}
		else
			@msg = { :status => false, :msg => "Falha ao atualizar o contador." }
		end
		render json: @msg
  end
end
