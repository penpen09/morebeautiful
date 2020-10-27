class AuthController < ApplicationController
  include AuthHelper
  def gettoken
    binding.pry
    token = get_token_from_code params[:code]
    binding.pry
    session[:kintone_token] = token.to_hash
    redirect_to feedbacks_url
  end
end
