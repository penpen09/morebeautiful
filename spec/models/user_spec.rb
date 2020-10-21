require 'rails_helper'
RSpec.describe User, type: :model do
  context 'バリデーション' do
    it '有効な状態であること' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
    it 'emailがなければ無効' do
      user = FactoryBot.build(:user, email: nil)
      expect(user).not_to be_valid
    end
    it 'nameを50文字以上にすると無効' do
      user = FactoryBot.build(:admin, name: 'a' * 55)
      expect(user).not_to be_valid
    end
    it 'プロフィールを900字以上にすると無効' do
      user = FactoryBot.build(:user, profile: 'あ' * 901)
      expect(user).not_to be_valid
    end
    it 'メイク道具を900字以上にすると無効' do
      user = FactoryBot.build(:user, make_tool: 'あ' * 901)
      expect(user).not_to be_valid
    end
    it 'youtubeチャンネルのurlを別のurlにすると無効' do
      user = FactoryBot.build(:user, youtube_channel: 'google.com')
      expect(user).not_to be_valid
    end
  end
end
