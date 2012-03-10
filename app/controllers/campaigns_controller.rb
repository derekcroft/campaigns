class CampaignsController < ApplicationController
  def index
    @campaign = Campaign.first
    redirect_to @campaign
  end

  def show
    @campaign = Campaign.first
  end

end
