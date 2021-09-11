require 'rails_helper'

RSpec.describe "RakutenSearches", type: :request do
  before do
    @user = create(:user)
    sign_in @user
    @anime = create(:anime)
  end

  describe "RakutenAPI search DVD" do
    it "show DVD page successfully" do
      get rakuten_search_path(anime_id: @anime.id, keyword: "日常")
      expect(response.body).to include "検索結果"
    end

    # it "display message not found if it have no dvds" do
    #   get rakuten_search_path(anime_id: @anime.id, keyword: "にちじょう")
    #   expect(response.body).to include "見つかりませんでした"
    # end
  end
end
