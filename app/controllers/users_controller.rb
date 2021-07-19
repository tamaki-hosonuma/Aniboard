class UsersController < ApplicationController
  before_action :set_current_user
  before_action :user

  def show
  end

  def edit
  end

  private
  def user
    @user = current_user
  end
  
end
