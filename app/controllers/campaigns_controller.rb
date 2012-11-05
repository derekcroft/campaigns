class CampaignsController < ApplicationController

  def index
    last_pledge = @campaign.pledges.last
    if stale?(last_pledge, public: true)
      render action: :show
    end
    expires_in 15.minutes, public: true
  end

  def popup
    @content = params['Content']
    render layout: nil
  end

end
