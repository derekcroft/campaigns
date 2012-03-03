class PledgesController < ApplicationController
  def new
    @campaign = Campaign.first
  end

  def create
    @campaign = params[:create]
  end
end
