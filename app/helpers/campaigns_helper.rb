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

  def share_this_url(team)
    "http://lts.kiindly.com".tap { |url|
      url << "/#{@team.subdomain}" if @team
    }
  end

  def youtube_url(video_id)
    url = "#{request.protocol}www.youtube"
    url << "-nocookie" if request.protocol.start_with?('https')
    url << ".com/embed/#{video_id}"
    url
  end

  def video_link
    content_tag(:iframe, allowfullscreen: '', frameborder: 0, height: 390, width: 640, src: youtube_url('IiBEj8j9g8c')) {}
  end

  def share_this_button(team, display_text, summary_type = nil)
    summary = summary_type == :long ? share_this_summary_long : share_this_summary_short
    tag_class = 'st_' + (display_text == 'Tweet' ? 'twitter' : display_text.downcase) + '_large'
    attrs = { class: tag_class, displaytext: display_text, st_url: share_this_url(@team) }
    attrs[:st_title] = summary if summary_type
    content_tag(:span, attrs) {}
  end

  def share_this_summary_long
    %{
      My donation was just matched by everyone that has pledged to the LTS Summer Fundraising Challenge.
      Click this link to join the cause and increase my donation.
      Donate through my team in this link and we can win an extra $250 from Athletico.
    }
  end

  def share_this_summary_short
    "Increase my donation in the LTS Fundraising Challenge while supporting my team and charity"
  end
end
