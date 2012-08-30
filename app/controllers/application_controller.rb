class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_campaign

  def load_campaign
    @campaign = Campaign.find_by_subdomain(request.subdomain)
    redirect_to 'http://www.kiindly.com' if @campaign.nil?
  end
end
