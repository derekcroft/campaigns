class PledgesController < ApplicationController
  def new
    @campaign = Campaign.first
    if params[:fixedamount].to_i < 5
      flash[:error] = "Fixed donation must be at least $5.00"
      redirect_to campaign_path(@campaign)
    end
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    customer = Stripe::Customer.create(description: "test_customer@gmail.com", card: params[:stripe_card_token])
  end

  def fb
    redirect_to new_campaign_pledge_path(campaign_id: params[:campaign_id], fixedamount: "7", signed_request: params[:signed_request])
  end

  private
  def base64_url_decode str
    encoded_str = str.gsub('-','+').gsub('_','/')
    encoded_str += '=' while !(encoded_str.size % 4).zero?
    Base64.decode64(encoded_str)
  end

  def decode_data str
   encoded_sig, payload = str.split('.')
   data = ActiveSupport::JSON.decode base64_url_decode(payload)
  end
end
