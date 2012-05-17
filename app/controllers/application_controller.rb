class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :filter_subdomain
  before_filter :load_campaign

  def filter_subdomain
    if Rails.env.production?
      unless %w{dev oupledge}.include?(request.subdomain)
        redirect_to 'http://www.kiindly.net'
        return false
      end
    end
  end

  def load_campaign
    @campaign = Campaign.first
  end
end
