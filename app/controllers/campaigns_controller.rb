class CampaignsController < ApplicationController
  def index
    @campaign = Campaign.first
    redirect_to @campaign
  end

  def show
    @campaign = Campaign.find(params[:id])
    @pledge = @campaign.pledges.build
  end

  def popup
    @content = params['Content']
    render layout: nil
  end

end
