class AnimesController < ApplicationController
  before_action :set_q
  before_action :user

  def index
    @animes = Anime.all
  end

  def search
    @results = @q.result(distinct: true)
  end

  def show
    @anime = Anime.find(params[:id])
    @post_user = User.find_by(params[:name])
  end
 
  private
  def set_q
    @q = Anime.ransack(params[:q])
  end

  def user
    @user = current_user
  end

end
