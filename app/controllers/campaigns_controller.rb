class CampaignsController < ApplicationController

  def index
    @team_id = params[:team_id]
    render action: :show
  end

  def popup
    @content = params['Content']
    render layout: nil
  end
end
