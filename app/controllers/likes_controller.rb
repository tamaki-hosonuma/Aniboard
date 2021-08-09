class LikesController < ApplicationController
  before_action :user
  before_action :post_params

  def create
    @like = Like.create(user_id: @user.id, post_id: params[:id])
    @like.save
  end

  def destroy
    @like = Like.find_by(user_id: @user.id, post_id: params[:id])
    @like.destroy
  end

  private
  def user
    @user = current_user
  end

  def post_params
    @post = Post.find(params[:id])
  end

end
