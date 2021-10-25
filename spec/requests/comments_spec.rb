require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    @comment = create(:comment)
    @post = @comment.post
    @user = @comment.post.user
    sign_in @user
  end

  context "with valid attributes" do
    it "add a comment" do
      c_params = { body: "Test is interesting", anime_id: @post.anime_id, user_id: @user.id, post_id: @post.id }
      expect { post anime_post_comments_path(c_params), params: {comment: c_params} }.to change(@user.comments, :count).by(1)
    end
  end

  context "with invalid attributes" do
    it "doesn't add a comment" do
      c_params = { body: "Test is interesting", anime_id: @post.anime_id, user_id: nil, post_id: @post.id }
      expect { post anime_post_comments_path(anime_id: @post.anime_id, post_id: @post.id), params: {comment: c_params} }.not_to change(@user.comments, :count)
    end
  end
end