module ApplicationHelper
  def logo(campaign, options={})
    image_tag "#{campaign.subdomain}/logo.jpg", options
  end

  def title(campaign, page_title)
    content_tag :title, "#{campaign.name} - #{page_title}"
  end

  def yes_no(boolean_value)
    boolean_value ? 'Yes' : 'No'
  end
end
