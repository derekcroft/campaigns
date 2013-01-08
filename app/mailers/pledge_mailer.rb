class PledgeMailer < ActionMailer::Base
  helper :campaigns
  default from: "donation@kiindly.com"

  def pledge_receipt_email(pledge)
    fetch_data(pledge)
    mail(to: @donor.email,
         bcc: 'derek@kiindly.com',
         subject: subject_line(pledge),
         template_path: "pledge_mailer/#{@campaign.subdomain}")
  end

  def pledge_confirmation_email(pledge)
    fetch_data(pledge)
    mail(to: @donor.email, 
         bcc: 'derek@kiindly.com', 
         subject: "Donation Receipt: #{@campaign.name}",
         template_path: "pledge_mailer/#{@campaign.subdomain}")
    @donor.confirmation_email_at = Time.now
    @donor.save!
  end

  private
  def subject_line(pledge)
    pledge_description = pledge.donate_cap? ? 'Donation Confirmation' : 'Dollar Match'
    "#{pledge_description} Confirmation: #{@campaign.name}"
  end

  def fetch_data(pledge)
    @pledge = pledge
    @donor = pledge.donor
    @campaign = pledge.campaign
    @stripe_customer = @donor.stripe_customer
  end
end
