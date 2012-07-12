class PledgeMailer < ActionMailer::Base
  default from: "donation@kiindly.com"

  def pledge_receipt_email(pledge)
    @pledge = pledge
    @donor = pledge.donor
    mail(to: @donor.email, subject: 'Penny Pledge Confirmation: Oakland Alumni Scholarship Fund')
  end

  def pledge_confirmation_email(pledge)
    @campaign = pledge.campaign
    @pledge = pledge
    @donor = pledge.donor
    @stripe_customer = YAML::load(@donor.stripe_customer)
    mail(to: @donor.email, cc: 'ouaa@oakland.edu', bcc: 'derek@kiindly.com', subject: 'Donation Receipt: OUAA Scholarship Fund')
    @donor.confirmation_email_at = Time.now
    @donor.save!
  end
end
