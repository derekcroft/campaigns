module ApplicationHelper
  def logo(campaign, options={})
    image_tag "#{campaign.subdomain}/logo.jpg", options
  end
end
