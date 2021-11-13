class UsersController < ApplicationController
  before_action :user

  def show
    @likes = Like.where(user_id: @user.id)
    @post_user = User.find_by(params[:name])
    @comments = Comment.where(user_id: @user.id)
  end

  def show_post
    @show_posts = Post.where(user_id: @user.id)
    @post_user = User.find_by(params[:name])
  end

  def like
  end

  def comment
  end

  private

  def user
    @user = current_user
  end
end
