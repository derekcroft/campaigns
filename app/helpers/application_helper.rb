module ApplicationHelper
  def logo(campaign, options={})
    image_tag "#{campaign.subdomain}/logo.jpg", options
  end

  def title(campaign, page_title)
    content_tag :title, "#{page_title} - #{campaign.name} #{campaign.description} - Kiindly"
  end
end
