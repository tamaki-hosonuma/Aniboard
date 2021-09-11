require 'rails_helper'

RSpec.describe 'Home', type: :system do
  describe "show" do
    it "displayed recent posts" do
      user = create(:user)
      login(user)
      anime = create(:anime)
      create_list(:post, 6, user: user, anime: anime)
      visit root_path
      expect(page).to have_selector "div.card", count: 6
    end
  end
end
