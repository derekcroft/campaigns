class CampaignsController < ApplicationController

  caches_page :index

  def index
    render action: :show
  end

  def popup
    @content = params['Content']
    render layout: nil
  end

end
