class PledgesController < ApplicationController
  respond_to :html

  def new
    @pledge = @campaign.pledges.build(params[:pledge])
  end

  def create
    @pledge = @campaign.pledges.build(params[:pledge])
    @pledge.pledge_type = 'dollar'
    begin
      c = Stripe::Customer.create(description: @pledge.donor.email, card: params[:stripe_card_token])
      @pledge.donor.stripe_customer ||= c
    rescue Exception => e
      logger.debug e.inspect
      flash[:error] = "Error validating credit card information."
      render action: 'new' and return
    end

    if @pledge.save
      PledgeMailer.pledge_receipt_email(@pledge).deliver
      render 'create'
    else
      render action: 'new'
    end
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
