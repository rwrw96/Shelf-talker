require "rails_helper"

RSpec.describe Review, "モデルに関するテスト", type: :model do
  describe "レビューを保存" do
    it "有効なレビューのみ保存されるか" do
      expect(FactoryBot.create(:review)).to be_valid
    end
  end
end

