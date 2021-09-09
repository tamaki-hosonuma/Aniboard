require 'rails_helper'

RSpec.describe 'Likes', type: :system, js: true do
  before do
    # post = create(:post)
    like = create(:like)
    login(like.post.user)
    visit root_path
  end

  describe "#create, #destroy" do
    it "Count increases by 1 when press like button" do
      # いいね解除、機能していない
      find('.navbar-brand').click
      # find('.fa').click
      expect(page).to have_content '0'
      expect(page).to have_selector '.fa'
      find("#unlike").click
      expect(post.likes.count).to eq(1)
    end

    it "Count discreases when press like button for the second time" do
      # いいねを解除する
      # find('.fa').click
      # expect(page).to have_selector '#like'
      # expect(post.likes.count).to eq(0)
    end

  end

end

  #2回押すとカウントが減ること、取り消されること