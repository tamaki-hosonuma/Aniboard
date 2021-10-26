require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "create post successfully" do
    it "create post if title, body and rate exist" do
      post = build(:post)
      expect(post).to be_valid
    end

    it "doesn't create post if title doesn't exist" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "create post if body is 1500 characters or less" do
      post = build(:post, body: "a" * 1500)
      expect(post).to be_valid
    end

    it "doesn’t create post if body is more than 1501 characters" do
      post = build(:post, body: "a" * 1501)
      expect(post).to be_invalid
    end

    it "doesn't create post if rate doesn't exist" do
      post = build(:post, rate: nil)
      expect(post).to be_invalid
    end

    it "doesn't create post if anime_title doesn't exist" do
      post = build(:post, anime_title: nil)
      expect(post).to be_invalid
    end
  end
end
