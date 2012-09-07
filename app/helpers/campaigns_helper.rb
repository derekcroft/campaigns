module CampaignsHelper
  def end_date(campaign)
    campaign.ends_on.strftime('%b %-d, %Y')
  end
end
