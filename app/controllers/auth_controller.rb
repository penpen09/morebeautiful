class AuthController < ApplicationController
  include AuthHelper
  def gettoken
    token = get_token_from_code params[:code]
    session[:kintone_token] = token.to_hash
    redirect_to feedbacks_url
  end
end
