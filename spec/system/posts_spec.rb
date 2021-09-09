require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  before do
    @user = create(:user)
    login(@user)
    @anime = create(:anime)
  end
  describe "display post successfully" do
    context "post exist" do
      before do
        create(:post, user_id: @user.id, anime_id: @anime.id)
      end
      it "display post " do
        visit root_path
        fill_in "q_title_cont", with: "日常"
        find(".fa-search").click
        find(".results").click
        expect(page).to have_selector ".post-card"
      end
    end

    context "no post" do
      it "display no post message" do
        visit root_path
        fill_in "q_title_cont", with: "日常"
        find(".fa-search").click
        find(".results").click
        expect(page).to have_content("まだ投稿がありません")
      end
    end
  end

end