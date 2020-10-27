
=begin
RoR Controller Sample
Copyright (c) 2018 Cybozu
Licensed under the MIT License
=end

require 'kintone'
class InquiriesController < ApplicationController
  include AuthHelper

  def new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      # Use token authentication
      api = Kintone::Api.new(ENV["KINTONE_DOMEIN"], ENV["KINTONE_API"])
      app = 25

      # Record register(single record)
      # Use Hash
      record = {"Customer_name" => {"value" => inquiry_params[:client_name]},
                "QType" => {"value" => inquiry_params[:contact_type]},
                "Detail" => {"value" => inquiry_params[:details]}
                }
      api.record.register(app, record)
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def inquiry_params
      params.require(:inquiry).permit(:client_name, :contact_type, :details)
    end
end
