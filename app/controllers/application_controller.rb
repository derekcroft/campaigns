class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :filter_subdomain
  
  def filter_subdomain
    unless request.subdomain == 'dev'
      redirect_to 'http://www.kiindly.net'
      return false
    end
  end
end
