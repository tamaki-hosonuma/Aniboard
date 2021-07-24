class PostsController < ApplicationController
  before_action :user
  # before_action :set_anime, only: [:new, :create]

  def index
    @posts = Post.includes(:anime, :user)
  end

  def show
    @post = Post.find(params[:id])
    @anime = Anime.find(params[:anime_id])
  end

  def new
    @anime = Anime.find(params[:anime_id])
    @user = current_user
    @post = Post.new
    # @animes = Anime.find_by(params[:post][:anime_id])
    # @anime = Anime.find(id: params[:anime_id])
  end

  def create
    @anime = Anime.find(params[:anime_id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to anime_path(@anime.id)
      flash[:notice] = "投稿が完了しました"
    else
      redirect_to new_anime_post_path
      flash[:notice] = "投稿に失敗しました"
    end
  end

  def edit
    @post = Post.find(params[:id])
    @anime = Anime.find(params[:anime_id])
  end

  def update
    @post = Post.find(params[:id])
    @anime = Anime.find(params[:anime_id])
    if @post.update(post_params)
      redirect_to anime_post_path
      flash[:notice] = "投稿の更新が完了しました"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id == @user.id
      @post.destroy
      flash[:success] = "削除しました"
      redirect_to user_path  
    end
  end

  private
  def user
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :body, :anime_title, :anime_id, :user_id, :rate)
    # params.require(:post).permit(:title, :body, :rate, :anime_title)
  end

  # def set_anime
  #   @anime = Anime.find(params[:id])
  # end
end
