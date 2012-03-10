class PledgesController < ApplicationController
  def new
    @campaign = Campaign.first
    if params[:fixedamount].to_i < 5
      flash[:error] = "Fixed donation must be at least $5.00"
      redirect_to campaign_path(@campaign)
    end
  end

  def create
    @campaign = params[:create]
  end
end
