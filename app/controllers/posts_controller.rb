class PostsController < ApplicationController
  before_action :user

  def new
  end

  def create
  end

  private
  def user
    @user = current_user
  end
end
