require 'rails_helper'

RSpec.describe 'Animes', type: :system do
  describe "Anime lists" do
    before do
      user = create(:user)
      login(user)
      create(:anime)
    end

    it "display search results" do
      visit root_path
      fill_in "q_title_cont", with: "日常"
      find(".fa-search").click
      expect(page).to have_content "日常"
    end

    it "have anime pages" do
      visit root_path
      fill_in "q_title_cont", with: "日常"
      find(".fa-search").click
      find(".results").click
      expect(page).to have_content "感想を投稿する"
    end
  end
end
