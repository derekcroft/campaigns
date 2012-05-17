class CampaignsController < ApplicationController
  def index
    show
    render action: 'show'
  end

  def show
    @pledge = @campaign.pledges.build
  end

  def popup
    @content = params['Content']
    render layout: nil
  end

end
