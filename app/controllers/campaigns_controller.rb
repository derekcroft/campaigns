class CampaignsController < ApplicationController
  force_ssl except: :index

  def index
    last_pledge = @campaign.pledges.last
    @pledge = @campaign.pledges.build
    if stale?(last_pledge, public: true)
      render action: :show
    end
    expires_in 15.minutes, public: true
  end

  def show
    last_pledge = @campaign.pledges.last
    @pledge = @campaign.pledges.build
    fresh_when last_pledge, public: true
    expires_in 15.minutes, public: true
  end

  def popup
    @content = params['Content']
    render layout: nil
  end

end
