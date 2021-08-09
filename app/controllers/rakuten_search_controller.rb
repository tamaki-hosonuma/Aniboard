class RakutenSearchController < ApplicationController
  before_action :user
  def search
    @anime = Anime.find(params[:anime_id])
    @dvds = RakutenWebService::Books::DVD.search(title: params[:keyword])
    render 'rakuten_search/show'
  end

  def show
  end

  def user
    @user = current_user
  end

  

end
