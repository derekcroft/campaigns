class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :perform_redirect
  before_filter :load_campaign

  def perform_redirect
    return if Rails.env.development?
    if request.domain.downcase.start_with?('kiindly') && !request.subdomain.downcase.eql?('oupledge')
      redirect_to "http://www.kiindly.net#{request.fullpath}"
      return false
    elsif request.domain.downcase.start_with?('oupledge') && !request.subdomain.downcase.eql?('www')
      redirect_to "#{request.protocol}www.#{request.domain.downcase}#{request.fullpath}"
      return false
    end
  end

  def load_campaign
    @campaign = Campaign.first
  end
end
