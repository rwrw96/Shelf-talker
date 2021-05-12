require "rails_helper"

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe "レビューを保存" do
    it "有効なレビューのみ保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
end
