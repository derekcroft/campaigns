class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_campaign

  def load_campaign
    @campaign = Campaign.first
  end
end
