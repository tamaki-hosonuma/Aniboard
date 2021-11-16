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

      it "display post" do
        visit root_path
        fill_in "q_title_cont", with: "日常"
        find(".fa-search").click
        find(".results").click
        expect(page).to have_selector(".post-card")
      end
    end

    context "no post" do
      it "display no post message" do
        visit root_path
        fill_in "q_title_cont", with: "日常"
        find(".fa-search").click
        find(".results").click
        expect(page).to have_content "まだ投稿がありません"
      end
    end
  end

  describe "post_user's page" do
    before do
      user = create(:user, name: "Joe", email: "tester@example.com", password: "111111")
      post = create(:post, user_id: user.id, anime_id: @anime.id)
      create(:like, post_id: post.id, user_id: post.user_id)
      create(:comment, post_id: post.id, user_id: post.user_id)
      visit root_path
    end

    it "display post_user's page" do
      click_on "Joe"
      expect(page).to have_selector(".post_user_sidebar")
    end

    it "display post_user's posts" do
      click_on "Joe"
      click_on "投稿"
      expect(page).to have_selector(".post_user_name")
    end

    it "display post_user's like_posts" do
      click_on "Joe"
      click_on "いいねした投稿"
      expect(page).to have_selector(".post_user_name")
    end

    it "display post_user's comments" do
      click_on "Joe"
      click_on "コメント"
      expect(page).to have_selector(".post_user_name")
    end
  end
end
