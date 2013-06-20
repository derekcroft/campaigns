module ApplicationHelper
  def logo(campaign, options={})
    image_tag "#{campaign.subdomain}/logo.jpg", options
  end

  def title(campaign, page_title)
    content_tag :title, "#{campaign.name} - #{page_title}"
  end

  def stripe_publishable_key(subdomain)
    stripe_mode
  end

  private
  def stripe_mode
    if params[:stripe_mode].present? && !Rails.env.production?
      return params[:stripe_mode] if %w{live test}.include?(params[:stripe_mode])
      raise "The stripe_mode param must equal 'live' or 'test'"
    end
    AccessToken.stripe_mode_for('lts')
  end
end
