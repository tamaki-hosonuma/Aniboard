require 'rails_helper'

RSpec.describe User, type: :model do

  describe "user registration" do
    it "is registered if name, email and password are exist" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
 
    it "is invalid with a duplicate email address" do
      User.create(
        name: "Joe",
        email: "tester@example.com",
        password: "111111",
      )
      user = User.new(
        name: "Jane",
        email: "tester@example.com",
        password: "111111",
      )
      user.valid?
      expect(user.errors[:email]).to include("は既に登録されています")
    end
  end
end
