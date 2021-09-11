require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before do
    @user = create(:user)
    sign_in(@user)
    @anime = create(:anime)
  end

  it "#new successfully" do
    get new_anime_post_path(@anime.id)
    expect(response).to be_successful
  end

  context "with valid attributes" do
    it "adds a post" do
      post_params = { title: "Test", body: "Test is interesting", rate: "3", anime_id: @anime.id, anime_title: @anime.title, user_id: @user.id }
      expect { post anime_posts_path(anime_id: @anime.id), params: { post: post_params, user_id: @user.id } }.to change(@user.posts, :count).by(1)
    end
  end

  context "with invalid attributes" do
    it "doesn't add a post" do
      post_params = { title: "Test", body: "Test is interesting", rate: "3", anime_id: nil, anime_title: @anime.title, user_id: @user.id }
      expect { post anime_posts_path(anime_id: @anime.id), params: { post: post_params } }.not_to change(@user.posts, :count)
    end
  end
end
