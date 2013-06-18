class CampaignsController < ApplicationController

  def index
    render action: :show
  end

  def popup
    @content = params['Content']
    render layout: nil
  end

end
