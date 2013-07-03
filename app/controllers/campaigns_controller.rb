class CampaignsController < ApplicationController
  before_filter :load_leaderboards, only: [:index]

  def index
    if params[:affiliate_code]
      @team = Team.where(url: "http://lts.kiindly.com/#{params[:affiliate_code]}").first
    end
    render action: :show
  end

  def popup
    @content = params['Content']
    render layout: nil
  end
end
