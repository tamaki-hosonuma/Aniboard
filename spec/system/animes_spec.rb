require 'rails_helper'

RSpec.describe 'Animes', type: :system do

  #検索すると結果が表示されること
  #入力、クリック
  #to have_content "検索結果"
  #検索結果クリック、to have_content "感想を投稿する"
  describe "Anime list" do
    before do
      user = create(:user)
      login(user)
      anime = create(:anime)
    end

    it "display search results" do
      visit root_path
      fill_in "q_title_cont", with: "日常"
      find(".fa-search").click
      expect(page).to have_content "日常"
    end

    it "have anime page" do
      visit root_path
      fill_in "q_title_cont", with: "日常"
      find(".fa-search").click
      find(".results").click
      expect(page).to have_content "感想を投稿する"
    end

  end

end