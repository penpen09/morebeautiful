require 'rails_helper'
RSpec.describe 'イベント管理機能', type: :system do
  before do
    @user = FactoryBot.create(:admin)
    @user.skip_confirmation!
    @user.save!
    visit new_user_session_path
    fill_in "Email address", with: 'admin@example.com'
    fill_in "Password", with: 'passwordadmin'
    click_on 'ログイン'
    FactoryBot.create(:label)
    FactoryBot.create(:label2)
    FactoryBot.create(:label3)
  end

  def event_create
    visit new_event_path
    fill_in 'タイトル', with: 'メイク1'
    fill_in '内容', with: 'メイクコンテント1'
    select '2020', from: :event_event_date_1i
    select '11月', from: :event_event_date_2i
    select '20', from: :event_event_date_3i
    select '15', from: :event_event_date_4i
    select '00', from: :event_event_date_5i
    fill_in '開催場所', with: 'オフライン'
    fill_in '参加費', with: 0
    check '顔'
    check '口もと'
    click_button "登録する"
    click_button "作成する"
  end
  def event2_create
    visit new_event_path
    fill_in 'タイトル', with: '毎日メイク'
    fill_in '内容', with: '時短でおしゃれ'
    select '2020', from: :event_event_date_1i
    select '12月', from: :event_event_date_2i
    select '20', from: :event_event_date_3i
    select '15', from: :event_event_date_4i
    select '00', from: :event_event_date_5i
    fill_in '開催場所', with: 'オフライン'
    fill_in '参加費', with: 100
    check '顔'
    check '口もと'
    click_button "登録する"
    click_button "作成する"
  end

  describe '新規作成機能' do
    context 'イベントを新規作成した場合' do
      it '作成したイベントが表示される' do
        visit new_event_path
        fill_in 'タイトル', with: 'event_title'
        fill_in '内容', with: 'event_content'
        select '2020', from: :event_event_date_1i
        select '11月', from: :event_event_date_2i
        select '20', from: :event_event_date_3i
        select '15', from: :event_event_date_4i
        select '00', from: :event_event_date_5i
        fill_in '開催場所', with: 'オフライン'
        fill_in '参加費', with: 0
        click_button "登録する"
        expect(page).to have_content 'event_title'
        expect(page).to have_content 'event_content'
      end
    end
    context 'イベントを新規作成した場合' do
      it '今日より前は作成できない' do
        visit new_event_path
        fill_in 'タイトル', with: 'event_title'
        fill_in '内容', with: 'event_content'
        select '2020', from: :event_event_date_1i
        select '10月', from: :event_event_date_2i
        select '20', from: :event_event_date_3i
        select '15', from: :event_event_date_4i
        select '00', from: :event_event_date_5i
        fill_in '開催場所', with: 'オフライン'
        fill_in '参加費', with: 0
        click_button "登録する"
        expect(page).to have_content '開催日時は本日以降のものを選択してください'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのイベント一覧が表示される' do
        event_create
        visit events_path
        expect(page).to have_content 'メイク1'
      end
    end
  end

  describe '検索機能' do
    before do
      event_create
      event2_create
    end
    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むイベントで絞り込まれる" do
        visit events_path
        fill_in 'タイトルから検索', with: '毎日'
        click_on '検索'
        expect(page).to have_content '毎日'
      end
    end
    context 'ラベルで検索をした場合' do
      it "完全一致するイベントが絞り込まれる" do
        visit events_path
        select '顔', from: :q_labels_name_cont
        click_on '検索'
        expect(page).to have_content '顔'
      end
    end
    context '日付検索をした場合' do
      it "該当する日付に完全一致するイベントが絞り込まれる" do
        visit events_path
        select '11月', from: :event_event_date_2i
        select '20', from: :event_event_date_3i
        click_button '検索'
        expect(page).to have_content 'メイク1'
      end
    end
  end

  describe '詳細表示機能' do
     context '任意のイベント詳細画面に遷移した場合' do
       it '該当イベントの内容が表示される' do
         event_create
         click_on 'メイク1'
         expect(page).to have_content 'メイクコンテント1'
       end
     end
  end
end
