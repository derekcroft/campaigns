class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_campaign
  before_filter :set_stripe_mode_param

  def load_campaign
    subdomain = request.subdomain.sub(/-staging$/, '')
    @campaign = Campaign.find_by_subdomain(subdomain)
    redirect_to 'http://www.kiindly.com' if @campaign.nil? && !Rails.env.development?
  end

  def set_stripe_mode_param
    @stripe_mode_param = stripe_mode
  end

  def stripe_mode
    if params[:stripe_mode].present? && !Rails.env.production?
      return params[:stripe_mode] if %w{live test}.include?(params[:stripe_mode])
      raise "The stripe_mode param must equal 'live' or 'test'"
    end
  end
end
