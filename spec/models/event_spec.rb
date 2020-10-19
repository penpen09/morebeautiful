require 'rails_helper'
RSpec.describe Event, type: :model do
  context 'バリデーション' do
    it 'titleがなければ無効' do
      user = FactoryBot.build(:event, title: nil)
      expect(user).not_to be_valid
    end
    it 'contentがなければ無効' do
      user = FactoryBot.build(:event, content: nil)
      expect(user).not_to be_valid
    end
    it 'feeがなければ無効' do
      user = FactoryBot.build(:event, fee: nil)
      expect(user).not_to be_valid
    end
    it 'feeをマイナスにすると無効' do
      user = FactoryBot.build(:event, fee: -1000)
      expect(user).not_to be_valid
    end
    it 'placeがなければ無効' do
      user = FactoryBot.build(:event, place: nil)
      expect(user).not_to be_valid
    end
    it 'event_dateを今日より前の日付にすると無効' do
      user = FactoryBot.build(:event, event_date: "2020-01-30 09:00:00" )
      expect(user).not_to be_valid
    end
    it 'event_dateを空欄にすると無効' do
      user = FactoryBot.build(:event, event_date: nil)
      expect(user).not_to be_valid
    end
    # it 'youtubeチャンネルのurlを別のurlにすると無効' do
    #   user = FactoryBot.build(:event, youtube_channel: 'google.com')
    #   expect(user).not_to be_valid
    # end
  end
end
