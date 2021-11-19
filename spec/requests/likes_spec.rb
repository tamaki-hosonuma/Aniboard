require 'rails_helper'

RSpec.describe "Likes", type: :request do
  before do
    @like = create(:like)
    @post = @like.post
    @user = @like.post.user
    sign_in @user
  end

  describe "create likes" do
    it "Count is increased by 1 when press like button" do
      expect { post create_like_path(user_id: @user.id, post_id: @post.id, id: @post.id), xhr: true }.to change(Like, :count).from(1).to(2)
    end

    it "Count is decreased by 1 when press unlike button " do
      expect { delete destroy_like_path(user_id: @user.id, post_id: @post.id, id: @post.id), xhr: true }.to change(Like, :count).from(1).to(0)
    end
  end
end
