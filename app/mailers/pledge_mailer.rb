class PledgeMailer < ActionMailer::Base
  default from: "donation@kiindly.com"

  def pledge_receipt_email(pledge)
    @pledge = pledge
    @donor = pledge.donor
    mail(to: @donor.email, subject: 'Penny Pledge Confirmation: Oakland Alumni Scholarship Fund')
  end
end
