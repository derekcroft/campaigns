class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_campaign

  def load_campaign
    subdomain = request.subdomain.sub(/-staging$/, '')
    @campaign = Campaign.find_by_subdomain(subdomain)
    redirect_to 'http://www.kiindly.com' if @campaign.nil?
  end
end
