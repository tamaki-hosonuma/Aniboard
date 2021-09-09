class RakutenSearchController < ApplicationController
  before_action :user
  def search
    @anime = Anime.find(params[:anime_id])
    if params[:keyword]
      @dvds = RakutenWebService::Books::DVD.search(title: params[:keyword])
    end
    render 'rakuten_search/show'
  end

  def show
  end

  def user
    @user = current_user
  end

end
