
# Rails x kintone OAuth client sample program
# feedback_controller.rb
# Copyright (c) 201x Cybozu
#
# Licensed under the MIT License
# https://opensource.org/licenses/mit-license.php

class FeedbacksController < ApplicationController
  include AuthHelper

  # kintoenのアプリケーションID
  APP_ID = ENV["KINTONE_APP_ID"]
  DOMAIN = ENV["KINTONE_SUB_DOMEIN"]

  def new
  # 初期ページロード状態では何もしない
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      token = get_access_token

      if token
        # アクセストークンがすでに取得されている場合、データをkintoneへポスト

        # ハッシュ形式でレコードを設定
        #
        record = {
          "app" => APP_ID,
          "record" => {
            "received_via" => {
              "value" => feedback_params[:received_via]
            },
            "category" => {
              "value" => feedback_params[:category]
            },
            "tenant_name" => {
              "value" => feedback_params[:tenant_name]
            },
            "opinion" => {
              "value" => feedback_params[:opinion]
            }
          }
        }

        response = token.post("#{DOMAIN}/k/v1/record.json", {:body => record.to_json, :headers => {'Authorization' => "Bearer #{token.token}", 'Content-Type' => 'application/json'}})

        redirect_to feedbacks_url
      else
        # アクセストークンが存在しない場合、ホームページへ戻り、承認のやり直し
        #
        redirect_to root_url
      end
    else
      render 'new'
    end
  end

  private
    def feedback_params
      # フォームからデータを取得
      params.require(:feedback).permit(:received_via, :category, :tenant_name, :opinion)
    end
end
