require 'csv'

class Payment
  extend ActionView::Helpers::NumberHelper

  def self.process_all
    CSV.open(File.join(Rails.root, 'db', "pledgesummary_#{Time.now.to_i}.csv"), "wb") do |csv|
      csv << [ 'Donor Name', 'Donor Email', 'Donor Address', 'Amount Pledged', 'Date Pledged', 'Actual Amount', 'Date Processed' ]
      Donor.all.each do |d|
        row = []
        row << "#{d.last_name}, #{d.first_name}"
        row << d.email
        row << "#{d.street_address}, #{d.city}, #{d.state} #{d.zip}"
        row << number_to_currency(d.donation_amount)
        row << d.created_at.strftime('%m/%d/%Y')
        row << number_to_currency(d.donation_amount)
        row << Time.now.strftime('%m/%d/%Y')
        csv << row
      end
    end
  end

  def self.pay!(donor)
    cust = YAML::load(donor.stripe_customer)
    amount = donor.amount
#    Stripe::Charge.create( 
  end
end
