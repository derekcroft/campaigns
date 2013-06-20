class PledgesController < ApplicationController
  respond_to :html

  def new
    @pledge = @campaign.pledges.build(params[:pledge])
  end

  def create
    @pledge = @campaign.pledges.build(params[:pledge])
    @pledge.pledge_type = 'dollar'
    begin
      api_key = AccessToken.stripe_api_key(@campaign.subdomain, @stripe_mode_param)
      c = Stripe::Customer.create({description: @pledge.donor.email, card: params[:stripe_card_token]}, api_key)
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

end
