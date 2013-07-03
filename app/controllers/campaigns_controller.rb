class CampaignsController < ApplicationController

  def index
    if params[:affiliate_code]
      @team = Team.where(url: "http://lts.kiindly.com/#{params[:affiliate_code]}").first
    end
    @leaders = Team.leaders
    @leaders_by_sport = @leaders.group_by(&:sport)
    render action: :show
  end

  def popup
    @content = params['Content']
    render layout: nil
  end
end
