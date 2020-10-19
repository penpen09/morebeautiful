require 'rails_helper'
RSpec.describe User, type: :model do
  context 'バリデーション' do
    it 'nameがなければ無効' do
      user = FactoryBot.build(:label, name: nil)
      expect(user).not_to be_valid
    end
    it 'nameが255字以上なら無効' do
      user = FactoryBot.build(:label2, name: 'あ' * 300)
      expect(user).not_to be_valid
    end
  end
end
