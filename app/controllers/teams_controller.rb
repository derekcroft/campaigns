class TeamsController < ApplicationController
  def show
    team = Team.where(url: "http://lts.kiindly.com/#{params[:affiliate_code]}").first
    redirect_to root_path(team_id: team.id)
  end
end
