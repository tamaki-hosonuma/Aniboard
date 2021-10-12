require 'rails_helper'

RSpec.describe "RakutenSearches", type: :request do
  before do
    @user = create(:user)
    sign_in @user
    @anime = create(:anime)
    @dvds = RakutenWebService::Books::DVD.search(title: "日常")
  end

  it "show DVD page successfully" do
    get rakuten_search_path(anime_id: @anime.id, keyword: "日常")
    expect(response.body).to include "検索結果"
  end

  context "If there are search results" do
    it "display the number of hits" do
      get rakuten_search_path(anime_id: @anime.id, keyword: "日常")
      expect(response.body).to include @dvds.count.to_s
    end
  end

  context "If there is no search result" do
    it "display as 0" do
      get rakuten_search_path(anime_id: @anime.id, keyword: "にちじょう")
      expect(response.body).to include "0件"
    end
  end
end
