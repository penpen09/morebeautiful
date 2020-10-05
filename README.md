# README

# メイクマッチングアプリ

## 概要
メイクが上手い人にメイクを教わることができるアプリです。投稿記事をみたり、イベントに参加したりして、メイクに不慣れな人やメイクを始めたばかりの人が、いろんな人のメイク術を学べます。

## コンセプト
見やすくて、直感的に操作がわかるようなシンプルなデザインを意識しました。

## バージョン
Ruby 2.6.5
Rails 5.2.4

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] パスワード再設定機能
- [ ] フォロー機能
- [ ] 検索機能

##### メイク記事
- [ ] メイク記事一覧表示機能
  - [ ] いいね数を表示
  - [ ] お気に入り数を表示
- [ ] メイク記事投稿機能
  - [ ] タイトル・記事内容・カテゴリーは必須
- [ ] メイク記事編集機能
- [ ] メイク記事削除機能
  - [ ] 記事編集とブログ削除は投稿者のみ実行可能
- [ ] メイク記事お気に入り機能
  - [ ] お気に入りについては1つのブログに対して1人1回しかできない
  - [ ] 自分自身の投稿記事にはお気に入りできない
- [ ] コメント投稿機能
- [ ] コメント削除機能
- [ ] コメント編集機能
  - [ ] コメント編集とコメント削除はコメントした本人のみ可能
- [ ] コメント機能とお気に入り機能についてはページ遷移なしで実行できる

##### メイク講座
- [ ] メイク講座作成機能
  - [ ] タイトル・詳細・開催場所・日時・カテゴリーは必須
- [ ] メイク講座編集機能
- [ ] メイク講座削除機能
- [ ] メイク講座参加機能
  - [ ] 参加者側：マイページで参加講座一覧を確認できる
  - [ ] 主催者側：参加者一覧がマイページで確認できる
- [ ] メイク講座キャンセル機能


## カタログ設計
https://docs.google.com/spreadsheets/d/1xBttXMAsBFYLgEdJ_-rmJs3scWC47D8RAtjrVFM1ppc/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1pbM8sr_gv1MTgVAQKYxLrVgrRjdcg0UGKmu06TXkpzI/edit?usp=sharing

## ER図


## 画面遷移図


## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1-lzC5tNGEPCOoQxwlfXbOVUtOLEOghNcMg4UoJ76_iU/edit?usp=sharing


## 使用予定Gem
* carrierwave
* mini_magick
* devise
* rails-admin
* cancancan
* bootstrap
* kaminari
* font-awesome-rails
* ransack
* fog-aws



# English Ver

# README

# Easy blog

## Overview
This app allows you to learn how to apply makeup from people who know how to do it well. People who are not familiar with make-up, or who have just started learning make-up can learn various make-up techniques by looking at the articles posted and attending events.

## Concept
I tried to create a simple design that is easy to read and intuitive to operate.

## Version
Ruby 2.6.5
Rails 5.2.4

## Functions list
- [ ] Login function
- [ ] User registration function
  - [ ] Email address, name and password are required
- [ ] Password reset function
- [ ] Blog list display function
  - [ ] Show number of comments
  - [ ] Show number of favorites
- [ ] Blog post function
  - [ ] Title and article content is required
- [ ] Blog edit function
- [ ] Blog deletion function
  - [ ] Posters can only do blog edit and blog deletion
- [ ] Blog favorite function
  - [ ] You can favorite only once per one blog
  - [ ] You can't favorite your own blog
- [ ] Comment post function
- [ ] Comment deletion function
- [ ] Comment edit function
  - [ ] Only comment contributors can edit and delete comments
- [ ] The comment function and favorite function can be executed without page transition.

## Catalog design,Table_Definition,Screen transition diagram,ER diagram,Wire frame


## To be used Gem
* carrierwave
* mini_magick
* devise
* rails-admin
* cancancan
* bootstrap
* kaminari
* font-awesome-rails
* ransack
* fog-aws
