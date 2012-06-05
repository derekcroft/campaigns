class Donor < ActiveRecord::Base

  belongs_to :campaign
  has_many :pledges

  attr_accessible :terms_of_service, :campaign_id, :first_name, :last_name, :email, :street_address, :city, :state, :zip, :phone, :email_opt_in

  validates :campaign, :first_name, :last_name, :street_address, :city, :state, :zip, presence: true
  validates :email, format: { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }, presence: true
  validates :stripe_customer, presence: true
  validates :terms_of_service, inclusion: [true]

  def donation_amount
    fixed_pledge_amount + penny_pledge_amount
  end

  def donor_number
    Donor.where(campaign_id: self.campaign_id).where(["id <= ?", self.id]).count
  end

  private
  def fixed_pledge_amount
    pledges.fixed.sum(:amount) || 0
  end

  def penny_pledge_amount
    pledges.penny.sum do |pledge|
      [(0.01 * campaign.number_of_eligible_pledges), (pledge.cap || 50.00)].min
    end
  end

end
