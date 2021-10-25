class CommentsController < ApplicationController
  before_action :user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to anime_path(params[:anime_id])
      flash[:notice] = "投稿が完了しました"
    else
      redirect_to anime_post_path(id: @post.id)
      flash[:notice] = "投稿に失敗しました"
    end
  end

  def new
    @post = Post.find(params[:post_id])
    @user = current_user
    @comment = Comment.new
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id]).destroy
    redirect_to anime_post_path(params[:post_id])
    flash[:notice] = "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)  
  end

  def user
    @user = current_user
  end
end
