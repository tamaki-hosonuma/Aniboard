require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Create comment successfully" do
    it "create comment if body, user_id and post_id exist" do
      comment = create(:comment)
      expect(comment).to be_valid
    end

    it "is invalid without user_id" do
      comment = build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user_id]).to include("を入力してください")
    end

    it "is invalid without post_id" do
      comment = build(:comment, post_id: nil)
      comment.valid?
      expect(comment.errors[:post_id]).to include("を入力してください")
    end

    it "create comment if body is 400 characters or less" do
      comment = create(:comment, body: "a" * 400)
      expect(comment).to be_valid
    end

    it "doesn’t create comment if body is more than 401 characters" do
      comment = build(:comment, body: "a" * 401)
      expect(comment).to be_invalid
    end
  end
end
