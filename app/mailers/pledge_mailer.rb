class PledgeMailer < ActionMailer::Base
  default from: "donation@kiindly.com"

  def pledge_receipt_email(pledge)
    fetch_data(pledge)
    mail(to: @donor.email, subject: 'Penny Pledge Confirmation: Oakland Alumni Scholarship Fund')
  end

  def pledge_confirmation_email(pledge)
    fetch_data(pledge)
    mail(to: @donor.email, cc: 'ouaa@oakland.edu', bcc: 'derek@kiindly.com', subject: 'Donation Receipt: OUAA Scholarship Fund')
    @donor.confirmation_email_at = Time.now
    @donor.save!
  end

  def confirmation_correction_email(pledge)
    fetch_data(pledge)
    mail(to: @donor.email, bcc: 'derek@kiindly.com', subject: 'Donation Receipt: OUAA Scholarship Fund - Correction')
    @donor.confirmation_correction_at = Time.now
    @donor.save!
  end

  private
  def fetch_data(pledge)
    @pledge = pledge
    @donor = pledge.donor
    @campaign = pledge.campaign
    @stripe_customer = YAML::load(@donor.stripe_customer)
  end
end
