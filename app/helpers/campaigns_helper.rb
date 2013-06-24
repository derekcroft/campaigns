module CampaignsHelper
  def end_date(campaign)
    campaign.ends_on.strftime('%b %-d, %Y')
  end

  def start_date(campaign)
    campaign.starts_on.strftime('%b %-d, %Y')
  end

  def count_me_in_button(host, team_id)
    protocol = Rails.configuration.ssl_enabled ? 'https' : 'http'
    render partial: 'campaigns/lts/count_me_in', locals: { team_id: team_id, protocol: protocol, host: host }
  end
end
