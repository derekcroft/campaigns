class TeamsController < ApplicationController
  def show
    team = Team.where(url: "http://lts.kiindly.com/#{params[:affiliate_code]}").first
    redirect_to new_pledge_path(pledge: { team_id: team.id })
  end
end
