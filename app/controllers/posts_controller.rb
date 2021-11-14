class PostsController < ApplicationController
  before_action :user

  def index
    @posts = Post.includes(:anime, :user)
  end

  def show
    @post = Post.find(params[:id])
    @anime = Anime.find(params[:anime_id])
    @post_user = User.find_by(params[:name])
    @comment =  Comment.new
    @comments = @post.comments.includes(:user)
  end

  def new
    @anime = Anime.find(params[:anime_id])
    @user = current_user
    @post = Post.new
  end

  def create
    @anime = Anime.find(params[:anime_id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to anime_path(@anime.id)
      flash[:notice] = "投稿が完了しました"
    else
      render :new
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

  def post_user
    @post_user = User.find(params[:id])
  end

  private

  def user
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:title, :body, :anime_title, :anime_id, :user_id, :rate)
  end
end
