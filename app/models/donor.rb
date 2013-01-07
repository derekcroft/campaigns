class Donor < ActiveRecord::Base

  belongs_to :campaign
  has_many :pledges

  attr_accessible :terms_of_service, :campaign_id, :first_name, :last_name, :email, :street_address, :city, :state, :zip, :phone, :email_opt_in

  validates :campaign, :first_name, :last_name, presence: true
  validates :email, format: { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }, presence: true
  validates :stripe_customer, presence: true
  validates :terms_of_service, inclusion: [true]

  scope :unprocessed, -> { where(processed_at: nil) }
  scope :processed, -> { where('processed_at is not null') }
  scope :unconfirmed, -> { where(confirmation_email_at: nil)}

  serialize :stripe_customer

  def donation_amount
    fixed_pledge_amount + matching_pledge_amount
  end

  def donor_number
    Donor.where(campaign_id: self.campaign_id).where(["id <= ?", self.id]).count
  end

  private
  def fixed_pledge_amount
    pledges.fixed.sum do |pledge|
      pledge.donate_cap? ? pledge.cap : pledge.amount
    end || 0.00
  end

  def matching_pledge_amount
    pledges.matching.sum do |pledge|
      [(0.01 * campaign.match_amount * campaign.number_of_eligible_pledges), pledge.cap].min
    end || 0.00
  end

end
