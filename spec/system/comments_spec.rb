require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  before do
    @comment = create(:comment)
    @post = @comment.post
    @user = @comment.post.user
    login(@user)
    visit root_path
    find(".user_name").click
    click_on "プロフィール変更"
    attach_file("user[image]", "#{Rails.root}/spec/fixtures/files/user_image.png", make_visible: true)
    fill_in "user_current_password", with: "#{@user.password}"
    click_on "更新する"
  end

  it "Post comment successfully" do
    visit anime_post_path(anime_id: @post.anime_id, id: @post.id)
    fill_in "comment_body", with: "a" * 100
    click_on "送信"
    click_on "コメントする"
    expect(page).to have_content "a" * 100
  end

  describe "display comment successfully" do
    it "display comment in user_page" do
      visit root_path
      click_on "マイページ"
      click_on "コメント"
      expect(page).to have_selector ".comment_box"
    end

    it "display comment in post_page" do
      visit anime_post_path(anime_id: @post.anime_id, id: @post.id)
      expect(page).to have_selector ".comment_box"
    end
  end
end
