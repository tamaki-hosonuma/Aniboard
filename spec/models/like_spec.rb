require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "create Likes" do
    before do
      @like = build(:like)
    end

    it "create" do
      expect(create(:like)).to be_valid
    end

    it "is invalid without user_id" do
      @like.user_id = nil
      @like.valid?
      expect(@like.errors[:user_id]).to include("を入力してください")
    end

    it "is invalid without post_id" do
      @like.post_id = nil
      @like.valid?
      expect(@like.errors[:post_id]).to include("を入力してください")
    end
  end
end
