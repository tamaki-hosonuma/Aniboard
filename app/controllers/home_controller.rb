class HomeController < ApplicationController
  before_action :user
  before_action :set_q

  def show
    @recent_posts = Post.order(created_at: :desc).limit(6)
    @post_user = User.find_by(params[:name])
  end

  def search
    @results = @q.result(distinct: true)
  end

  private

  def set_q
    @q = Anime.ransack(params[:q])
  end

  def user
    @user = current_user
  end
end
