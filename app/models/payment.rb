require 'csv'

class Payment
  extend ActionView::Helpers::NumberHelper

  def self.process_all
    CSV.open(File.join(Rails.root, 'db', "pledgesummary_#{Time.now.to_i}.csv"), "wb") do |csv|
      csv << [ 'Donor Name', 'Donor Email', 'Donor Address', 'Amount Pledged', 'Date Pledged', 'Actual Amount', 'Date Processed', 'Successful' ]
      Donor.all.each do |d|
        row = []
        row << "#{d.last_name}, #{d.first_name}"
        row << d.email
        row << "#{d.street_address}, #{d.city}, #{d.state} #{d.zip}"
        row << number_to_currency(d.donation_amount)
        row << d.created_at.strftime('%m/%d/%Y')
        row << number_to_currency(d.donation_amount)
        row << d.processed_at.try(:strftime, '%m/%d/%Y')
        if d.processed_at.nil?
          e = YAML::load(d.stripe_response)
          row << e.code
        else
          row << 'Success'
        end
        csv << row
      end
    end
  end

  def self.pay!(donor)
    return unless donor.processed_at.nil?
    cust = donor.stripe_customer
    amount = (donor.donation_amount*100).to_i
    begin
      response = Stripe::Charge.create(
        amount: amount,
        currency: 'usd',
        customer: cust.id,
        description: "Donation for #{donor.campaign.name} #{donor.campaign.campaign_type} match campaign"
      )
      donor.stripe_response = response
      donor.processed_at = Time.now
    rescue Exception => e
      donor.stripe_response = e
      pp e
    end
    donor.save!
    response
  end

  def self.confirm!(donor)
    return if donor.processed_at.nil? || donor.confirmation_email_at?
    pledge = donor.pledges.first
    PledgeMailer.pledge_confirmation_email(pledge).deliver
  end
end
