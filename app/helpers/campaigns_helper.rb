module CampaignsHelper
  def end_date(campaign)
    campaign.ends_on.strftime('%b %-d, %Y')
  end

  def start_date(campaign)
    campaign.starts_on.strftime('%b %-d, %Y')
  end

  def logo(campaign, options={})
    image_tag "sites/#{campaign.subdomain}/logo.jpg", options
  end
end
