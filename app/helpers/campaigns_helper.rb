module CampaignsHelper
  def end_date(campaign)
    campaign.ends_on.strftime('%b %-d, %Y')
  end

  def start_date(campaign)
    campaign.starts_on.strftime('%b %-d, %Y')
  end

  def count_me_in_button(host)
    protocol = Rails.env.production? ? 'https' : 'http'
    button_to "COUNT ME IN", { protocol: protocol, host: host, controller: 'pledges', action: 'new' }, { method: :get, style: 'width:230px;' }
  end
end
